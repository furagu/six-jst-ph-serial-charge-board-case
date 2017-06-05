$fn=100;

main(
    board_size   = [33.5, 88.7, 1.7],
    thickness    = 1.5,
    grip         = 2.5,
    bevel        = 0.5,
    bottom_gap   = 2.3,
    corner_r     = 2,
    wire_r       = 1,
    wire_gap     = 7.5,
    wire_stand_r = 9,
    stand_length = 35,
    stand_width  = 8,
    stand_offset = 24
);

module main() {
    box_length = board_size[0] + thickness * 2;
    box_width = board_size[1] + thickness * 2;
    box_height = thickness + bottom_gap + board_size[2] + bevel;

    difference() {
        union() {
            difference() {
                translate([corner_r, corner_r, 0])
                    minkowski() {
                        cube([box_length - corner_r * 2, box_width - corner_r * 2, box_height - 1]);
                        cylinder(h=1, r=corner_r);
                    }

                translate([thickness + grip, thickness + grip, thickness])
                    cube(size=[board_size[0] - grip * 2, board_size[1] - grip * 2, 20]);

                translate([thickness, thickness, thickness + bottom_gap])
                    cube(size=[board_size[0], board_size[1], 20]);
            }
        }
    }
}
