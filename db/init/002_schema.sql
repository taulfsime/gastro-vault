-- users
CREATE TABLE
  chef (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4 (),
    name text NOT NULL
  );

-- ingredients
CREATE TABLE
  ingredient (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4 (),
    name text NOT NULL,
    dimension text NOT NULL CHECK (dimension IN ('mass', 'volume', 'count')),
    -- mass (g), volume (ml), count (pcs)
    quantity double precision NOT NULL
  );

-- recipes
CREATE TABLE
  recipe (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4 (),
    owner_id uuid NOT NULL REFERENCES chef (id) ON DELETE CASCADE,
    title text NOT NULL,
    description text
  );

-- recipe ingredients
CREATE TABLE
  recipe_ingredient (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4 (),
    recipe_id uuid NOT NULL REFERENCES recipe (id) ON DELETE CASCADE,
    ingredient_id uuid NOT NULL REFERENCES ingredient (id) ON DELETE CASCADE,
    quantity INT NOT NULL
  );

-- recipe steps
CREATE TABLE
  recipe_step (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4 (),
    recipe_id uuid NOT NULL REFERENCES recipe (id) ON DELETE CASCADE,
    position INT NOT NULL,
    duration INT CHECK (duration >= 0),
    ingredients uuid[] NOT NULL DEFAULT '{}'::uuid[]
  );
