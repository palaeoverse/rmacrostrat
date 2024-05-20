#' @param adjacents \code{}. boolean, if lat/lng or col_id is specified, optionally return all units in columns that touch the polygon containing the supplied lat/lng
#' @param age \code{}. numerical age in millions of years before present
#' @param age \code{}. Can be between 0 and 550
#' @param age \code{}. integer, an age in Ma - will find all intervals that overlap with this age
#' @param age_bottom \code{}. numerical age (Ma) - must be used with age_top and be greater than age_top
#' @param age_bottom \code{}. numerical age (Ma) - must be used with age_top and be greater than age_top; note that returned units may not be entirely contained by age_top and age_bottom, but they will intersect that age range in whole or in part
#' @param age_top \code{}. numerical age (Ma) - must be used with age_bottom and be less than age_bottom
#' @param all \code{}. Show all results
#' @param all \code{}. return all drilling expeditions and sites
#' @param all \code{}. return all language definitions
#' @param all \code{}. return all lithology definitions
#' @param all \code{}. return all lithology attribute definitions
#' @param all \code{}. return all structure definitions
#' @param all \code{}. Return all column definitions
#' @param all \code{}. return all environment definitions
#' @param all \code{}. return all interval definitions
#' @param all \code{}. return all source definitions
#' @param all \code{}. return all lithostratigraphic names
#' @param all \code{}. return all available timescales
#' @param all \code{}. return all available minerals
#' @param all \code{}. return all available projects
#' @param all \code{}. return all measurement definitions
#' @param all \code{}. return all column groups
#' @param all \code{}. Return all grain sizes
#' @param all \code{}. return all references
#' @param att_type \code{}. string, lithology attribute type
#' @param b_age \code{}. number, an early age in Ma
#' @param buffer \code{}. integer, buffer in meters that should be applied to a provided shape
#' @param carto \code{}. Restrict results to map components present in one of Macrostrat's map harmonized scales: tiny, small, medium, large
#' @param cellArea \code{}. target cell area in km^2
#' @param certainty \code{}. A string to search the certainty field for (fuzzy)
#' @param classification \code{}. The classification scheme the given grain belongs to
#' @param cltn_id \code{}. integer, one or more Paleobiology Database collection IDs
#' @param code \code{}. string, an ISO 639-3 or ISO 639-1 language code
#' @param col_group_id \code{}. integer, one or more Macrostrat column group ids; corresponds to legs/expeditions
#' @param col_group_id \code{}. groups
#' @param col_group_id \code{}. integer, one or more column group ids
#' @param col_group_id \code{}. get col_group data for specific col_group_id
#' @param col_id \code{}. integer, a valid column id
#' @param col_id \code{}. One or more comma-separated valid column IDs
#' @param col_id \code{}. integer, id for column containing measurements
#' @param col_id \code{}. A valid col_id
#' @param col_id \code{}. integer, one or more Macrostrat column ids
#' @param col_id \code{}. columns
#' @param col_id \code{}. integer, one or more column ids
#' @param col_id \code{}. get col_group data for specific column
#' @param col_name \code{}. string, column name
#' @param col_type \code{}. string, a column type
#' @param comments \code{}. A string to search the comments field for (fuzzy)
#' @param comments \code{}. A string to search for in the map unit comments
#' @param concept_id \code{}. uniqe id for stratigraphic concepts
#' @param concept_id \code{}. unique id
#' @param concept_name \code{}. string specifying concept name
#' @param description \code{}. A string to search for in the map unit description
#' @param econ \code{}. string, name of an economic attribute
#' @param econ \code{}. name of an econ
#' @param econ_class \code{}. string, name of an economic attribute class
#' @param econ_class \code{}. econs
#' @param econ_class \code{}. an econ class
#' @param econ_id \code{}. integer, ID of an economic attribute from /defs/econs
#' @param econ_id \code{}. econs
#' @param econ_id \code{}. econ identifier
#' @param econ_type \code{}. string, name of an economic attribute type
#' @param econ_type \code{}. econs
#' @param econ_type \code{}. econ type
#' @param element \code{}. string, chemical element abbreviation, case sensitive (e.g., Co)
#' @param environ \code{}. string, specific environment
#' @param environ \code{}. environment
#' @param environ_class \code{}. string, general environments
#' @param environ_class \code{}. environments
#' @param environ_class \code{}. environment class
#' @param environ_id \code{}. integer, specific environment ID from /defs/environments
#' @param environ_id \code{}. environments
#' @param environ_type \code{}. string, groups of environments
#' @param environ_type \code{}. environments
#' @param environ_type \code{}. environment type
#' @param epoch \code{}. string, drilling 'epoch'; only three valid values (DSDP, ODP and IODP), but note that Baggage Stipper limited to IODP
#' @param epoch \code{}. string, drilling 'epoch'; only three valid values. DSDP, ODP and IODP
#' @param exclude \code{}. Definitions to exclude
#' @param format \code{}. string, desired output format
#' @param format \code{}. Desired output format
#' @param format \code{}. Desired output format. Default is GeoJSON
#' @param format \code{}. Desired output format. Default is JSON
#' @param format \code{}. desired output format, options given below in output_formats
#' @param geom_age \code{}. If requesting a geographic format, specifies which age to use for the primary coordinates. Accepted parameters are 'modern' (clat, clng), 'top' (t_plat, t_plng) and 'bottom' (b_plat, b_plng). Default is 'modern'
#' @param grain_group \code{}. The family of grains the grain belongs to
#' @param grain_id \code{}. Unique grain ID
#' @param grain_name \code{}. The name of the grain
#' @param grain_symbol \code{}. The grain symbol for display purposes
#' @param id \code{}. an environment id
#' @param include \code{}. Definitions to include
#' @param int_id \code{}. integer, a chronostratigraphic time interval ID from /defs/intervals
#' @param int_id \code{}. intervals
#' @param int_id \code{}. integer, one or more comma-separated interval IDs
#' @param interval_name \code{}. string, chronostratigraphic time interval name
#' @param interval_name \code{}. A named time interval
#' @param interval_name \code{}. string, an interval name to restrict measurements matched to units touching given age
#' @param interval_name \code{}. chronostratigrpahic interval name (see /defs/intervals); this will return only strat_names with a declared age in Macrostrat
#' @param lat \code{}. number, decimal degree latitude, WGS84
#' @param lat \code{}. A valid latitude in decimal degrees
#' @param lat \code{}. A valid latitude
#' @param latSpacing \code{}. the number of times a hemisphere should be cut
#' @param latSpacing \code{}. the number of degrees between bands of latitude
#' @param leg \code{}. string, drilling leg (or expedition for IODP, e.g., leg=317)
#' @param leg \code{}. string, drilling leg (or expedition for IODP)
#' @param lith \code{}. string, specific lithology name (e.g., shale, sandstone)
#' @param lith \code{}. string, lithology
#' @param lith_att \code{}. string, specific lithology attribute name (e.g. fine, olivine, poorly washed)
#' @param lith_att \code{}. string, lithology attribute
#' @param lith_att_id \code{}. integer, ID of a lithology attribute from /defs/lithology_attributes
#' @param lith_att_id \code{}. lithology_attributes
#' @param lith_att_id \code{}. integer, one or more lithology attribute ids
#' @param lith_att_type \code{}. string, specific category of lithology attribute (e.g. grains, lithology, bedform)
#' @param lith_class \code{}. string, general lithologies (sedimentary, igneous, metamorphic)
#' @param lith_class \code{}. String, one or more comma-separated lithology classes
#' @param lith_class \code{}. string, one or more lithology classes
#' @param lith_class \code{}. lithologies
#' @param lith_class \code{}. string, lithology class
#' @param lith_group \code{}. string, group of lithologies (e.g., unconsolidated)
#' @param lith_group \code{}. string, groups of lithologies (e.g., sandstones, mudrocks, unconsolidated)
#' @param lith_group \code{}. string, lithology group
#' @param lith_id \code{}. integer, ID of a lithology from /defs/lithologies
#' @param lith_id \code{}. Integer(s), one or more comma-separated integers identifying specific lithologies
#' @param lith_id \code{}. integer, one or more ids for lith (see /defs/lithologies)
#' @param lith_id \code{}. lithologies
#' @param lith_id \code{}. integer, one or more lithology ids
#' @param lith_type \code{}. string, groups of lithologies (e.g., carbonate, siliciclastic)
#' @param lith_type \code{}. string, type of lithologies (e.g., carbonate, siliciclastic)
#' @param lith_type \code{}. string, types of lithologies (e.g., carbonate, siliciclastic)
#' @param lith_type \code{}. String, one or more comma-separated lithology types
#' @param lith_type \code{}. string, one or more lithology types
#' @param lith_type \code{}. lithologies
#' @param lith_type \code{}. string, lithology type
#' @param lng \code{}. number, decimal degree longitude, WGS84
#' @param lng \code{}. A valid longitude in decimal degrees
#' @param lng \code{}. A valid longitude
#' @param lngSpacing \code{}. divide bands of latitude by x degrees of longitude
#' @param lngSpacing \code{}. the number of degrees between bands of longitude
#' @param map_id \code{}. integer, one or more polygon map_ids to search for
#' @param maxlat \code{}. A maximum latitude that represents the northeast corner of a bounding box (requires minlat, minlng, and maxlng)
#' @param maxlng \code{}. A maximum longitude that represents the northeast corner of a bounding box (requires minlat, minlng, and maxlat)
#' @param measure_id \code{}. integer, specific measurement id
#' @param measure_id \code{}. integer, one or more comma-separted measurement IDs
#' @param measure_phase \code{}. string, phase from which measurement was taken (e.g., 'zircon')
#' @param measurement \code{}. string, measurement definition name
#' @param measurement_class \code{}. string, measurement definition class
#' @param measurement_class \code{}. string, measurement_class
#' @param measurement_id \code{}. integer, measurement definition unique identifier
#' @param measurement_type \code{}. string, measurement definition type
#' @param measurement_type \code{}. string, measurement_type
#' @param measuremeta_id \code{}. integer, specific id for measurment metadata (generally a sample)
#' @param mineral \code{}. string, name of mineral
#' @param mineral_type \code{}. string, type of mineral (e.g., feldspar)
#' @param minlat \code{}. A minimum latitude that represents the southwest corner of a bounding box (requires minlng, maxlat, and maxlng)
#' @param minlng \code{}. A minimum longitude that represents the southwest corner of a bounding box (requires minlat, maxlat, and maxlng)
#' @param name \code{}. string, the name of a language
#' @param name \code{}. string, interval name
#' @param originLat \code{}. An optional origin latitude
#' @param originLng \code{}. An option origin longitude
#' @param plate_id \code{}. One or more plate_ids to query
#' @param point_id \code{}. One or more comma-separated valid point_ids
#' @param point_type \code{}. One or more comma-separated point_types
#' @param project_id \code{}. a Macrostrat project ID
#' @param project_id \code{}. One or more comma-separated valid project IDs
#' @param project_id \code{}. integer, id for project
#' @param project_id \code{}. integer, one or more project ids
#' @param project_id \code{}. integer identifying project(s), separate multiple values with commas
#' @param project_id \code{}. limit results to specific project
#' @param query \code{}. The search term
#' @param rank \code{}. lithostratigraphic rank
#' @param ref_id \code{}. retrieve only stratigraphic names linked the specified reference_id (see /defs/refs)
#' @param ref_id \code{}. integer, one or more comma-separted reference ids
#' @param response \code{}. Any available response_type. Default is short.
#' @param response \code{}. Any available response_type. Default is short. Use 'light' for effecient return of measurements with little metadata
#' @param rule \code{}. used with t_age and b_age to determine how intersecting intervals are identified: 'contains' returns intervals that fall entirely within t_age and b_age, 'exact' returns intervals with boundaries equal to t_age,b_age. Default is 'loose', returns any interval touching the range of t_age and b_age
#' @param rule \code{}. Can be 'all' or 'down'. Down will return any children of the requested stratigraphic name, and all will return the entire stratigraphic name hierarchy that the request name belongs to
#' @param sample \code{}. Return a sample of data
#' @param sample \code{}. if present, show a subset of the data
#' @param sample \code{}. if present, get a selection of data
#' @param sample \code{}. Get a sample response
#' @param scale \code{}. Can be 'small', 'medium', or 'large'
#' @param scale \code{}. Restrict results to maps of a specific scale(s) in Macrostrat's system, can be tiny, small, medium, or large
#' @param scale \code{}. string, one or more comma-separated Burwell scales (tiny, small, medium, large)
#' @param section_id \code{}. integer, a valid section id
#' @param section_id \code{}. integer, id for section containing measurements
#' @param section_id \code{}. A valid section_id
#' @param shape \code{}. string, a WKT geometry that can be used to filter sources
#' @param shape \code{}. A valid WKT geometry
#' @param show_position \code{}. If present, return the unit top and bottom position in section
#' @param show_values \code{}. if present, show measurements as arrays, grouped by measuremeta_id and measurement_id
#' @param site \code{}. string, drilling site (e.g., U1351)
#' @param site \code{}. string, drilling site
#' @param soil_group \code{}. The family of soils the grain belongs to
#' @param source_id \code{}. One or more comma-separated source_ids
#' @param source_id \code{}. Integer(s), one or more comma-separated integers identifying map sources
#' @param source_id \code{}. integer, one or more comma-separated source IDs
#' @param status \code{}. string, status of column, values 'active','in process','obsolete'
#' @param strat_name \code{}. a fuzzy stratigraphic name to match units to
#' @param strat_name \code{}. lithostratigraphic name, exact match
#' @param strat_name_concept_id \code{}. One or more stratigraphic name concepts from /defs/strat_name_concepts
#' @param strat_name_concept_id \code{}. strat_name_concepts
#' @param strat_name_id \code{}. integer, a single or comma-separated list of stratigraphic IDs from /defs/strat_names
#' @param strat_name_id \code{}. One or more comma-separted valid strat_name_ids from /defs/strat_names
#' @param strat_name_id \code{}. integer, one or more valid strat_name_ids from /defs/strat_names
#' @param strat_name_id \code{}. strat_names
#' @param strat_name_id \code{}. unique id
#' @param strat_name_like \code{}. lithostratigraphic name, with open-ended string matching
#' @param structure \code{}. string, structure
#' @param structure_class \code{}. string, structure class
#' @param structure_group \code{}. string, structure group
#' @param structure_id \code{}. integer, one or more structure ids
#' @param structure_like \code{}. string, loose match to structure
#' @param structure_type \code{}. string, structure type
#' @param summarize_measures \code{}. If present, returns summary statistics about the measurements associated with each unit
#' @param t_age \code{}. number, a late age in Ma
#' @param timescale \code{}. string, a valid timescale name as defined in /api/v2/defs/timescales
#' @param timescale_id \code{}. timescales
#' @param timescale_id \code{}. integer, a valid timescale_id as defined in /api/v2/defs/timescales
#' @param true_colors \code{}. boolean, returns original international time scale colors
#' @param unit_id \code{}. integer, a valid unit id
#' @param unit_id \code{}. One or more comma-separated valid unit IDs
#' @param unit_id \code{}. integer, one or more valid unit_ids from /units
#' @param unit_id \code{}. integer, one or more ids for unit containing measurements
