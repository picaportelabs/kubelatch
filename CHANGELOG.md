# Changelog

## [0.29.0](https://github.com/picaportelabs/kubelatch/compare/v0.28.0...v0.29.0) (2026-10-09)


### Features

* **groups:** extend a group permission (PATCH /api/groups/{id}/grants/{gid}) from the group page, with its derived rows and audit event ([af04764](https://github.com/picaportelabs/kubelatch/commit/af04764e0230d3f99ff03bd6a05bf214f12df55a))
* **web:** Access column and Add to a group in Users, the origin on Home, a Permissions link per cluster ([6b3475c](https://github.com/picaportelabs/kubelatch/commit/6b3475c7ee26aa599cc0aa42c2c523071f310407))
* **web:** audit log labels for the group actions and the grant expiry change ([c17f24f](https://github.com/picaportelabs/kubelatch/commit/c17f24f3166a840dee5fa58d405a163ad76b1a8c))
* **web:** grant several accounts and scopes in one batch ([6ce81df](https://github.com/picaportelabs/kubelatch/commit/6ce81dfb39378dd354d155fd7f5c07cdc02e832e))
* **web:** group helpers, fixtures, dictionaries and the Groups nav item ([f529cd8](https://github.com/picaportelabs/kubelatch/commit/f529cd8798de59bc5ed57d89f997332b80e519c3))
* **web:** MultiSelect with chips, a shared ExpiryField and the origin pill ([e28b024](https://github.com/picaportelabs/kubelatch/commit/e28b02409a42ead16aef1553c650b295cb43df49))
* **web:** permissions by account, by cluster and as a list, with their origin ([2481f84](https://github.com/picaportelabs/kubelatch/commit/2481f84fbd0b4a448ac4b0d6b3c232cef5b8b32a))
* **web:** the group page with its members, permissions and details ([8580e2c](https://github.com/picaportelabs/kubelatch/commit/8580e2c6870ae8daeec0e6e346f77c3180059426))
* **web:** the Groups page, its creation sheet, delete confirmation and palette entries ([d06fac6](https://github.com/picaportelabs/kubelatch/commit/d06fac6b35f7e8118b9cd3efe384fca40b3519ca))


### Bug Fixes

* **web:** arrow keys on the permissions view selector, and Add to a group waits for the memberships before offering groups ([c175b92](https://github.com/picaportelabs/kubelatch/commit/c175b92b0f7d2fee380a0a38f116b17d58092c0d))
* **web:** drop the refused-entry line when the batch changes and tidy the grant form ([0f8c830](https://github.com/picaportelabs/kubelatch/commit/0f8c830323daab17bd6f26e28b2e4d6992dab8b9))
* **web:** group page findings of the milestone 3 review (blocked members, extend guard, limits, pending states) ([bd2e5a7](https://github.com/picaportelabs/kubelatch/commit/bd2e5a7e0c007f7c3909b32f814c8b4534878ebc))
* **web:** one copy of the group dictionary blocks, a 24 px chip target and the tinted hover of the group pill ([931350e](https://github.com/picaportelabs/kubelatch/commit/931350eceb9e3d82f9cd046c291be19bc6d62457))
* **web:** permissions overlap over the unfiltered set, guard-clean texts, detail and header coverage ([a30d385](https://github.com/picaportelabs/kubelatch/commit/a30d385514f5415fd44fb8fd700d8cd162578ff1))
* **web:** permissions page findings of the milestone 3 review (header a11y, stale refusal, overlaps under a group filter, chip focus) ([461569c](https://github.com/picaportelabs/kubelatch/commit/461569c43b8d4f01117d0940c0fc2f3f6a139010))
* **web:** quote logins and names with «» in the Spanish group texts, and cover every overlap rule ([af9f91d](https://github.com/picaportelabs/kubelatch/commit/af9f91de69a2daa28c61fd06af1895faeaa826e1))
* **web:** refresh after a late add-to-group response, restore focus to the row menu, grants mock with a source ([6533537](https://github.com/picaportelabs/kubelatch/commit/6533537cb647e3cfdb86c6bfec50ccacc86685ed))
* **web:** refresh from the mutation hooks and restore focus on the group page ([94e058c](https://github.com/picaportelabs/kubelatch/commit/94e058c7d5281b6219eb99602981fa383d0ebc61))

## [0.28.0](https://github.com/picaportelabs/kubelatch/compare/v0.27.1...v0.28.0) (2026-10-09)


### Features

* **api:** /api/groups, members and group permissions ([e8d5569](https://github.com/picaportelabs/kubelatch/commit/e8d5569afe58ec88133b391f41e0d347679ee4bb))
* **api:** grant source and group filter, derived grants revoke from their group, grant batches, tier covers, subject access counts ([e6f6ab6](https://github.com/picaportelabs/kubelatch/commit/e6f6ab679340a0570aaecbc95d7f9adabbeead2e))
* **groups:** agents ceiling regression, SPA API types and reference docs ([18728e6](https://github.com/picaportelabs/kubelatch/commit/18728e63c17f6a70729e15f8b0eca83ee2e7992d))
* **groups:** the group service, with derived grants synchronised in each transaction ([10681d8](https://github.com/picaportelabs/kubelatch/commit/10681d87310b5eeca1de07d8fd2da283c4bd5bc9))
* **rbac:** tier covers, and deleting or narrowing a role sees its group permissions ([f8bddf7](https://github.com/picaportelabs/kubelatch/commit/f8bddf73e1a9f8c039dbdbaeea05c83e2880f1ea))
* **rbac:** ValidateTarget shared by direct grants and group permissions, and CreateBatch ([7a564c3](https://github.com/picaportelabs/kubelatch/commit/7a564c32325bf8390f5aaf325895e2138663aec2))
* **store:** group reads, counts and the derived grant synchronisation ([bd0bcc6](https://github.com/picaportelabs/kubelatch/commit/bd0bcc669944a83c114d95e16b0fed2323db7937))
* **store:** groups, members, group grants and the origin of a derived grant ([f3538a5](https://github.com/picaportelabs/kubelatch/commit/f3538a5979de93e9378c09d9b3d07df18a5dec7a))


### Bug Fixes

* **api:** name the batch index on every grant failure ([6128e7a](https://github.com/picaportelabs/kubelatch/commit/6128e7a31caad953e426fb45449058d0241986af))
* **groups:** prove the group lock with a removal race, event order in Delete, narrower reconcile on expiry updates ([d7b0c7a](https://github.com/picaportelabs/kubelatch/commit/d7b0c7a7669c3f9b4112c2805c21b4071728b902))
* **groups:** validate on the pool before locking, and re-validate permissions for new and revived members ([f48eaed](https://github.com/picaportelabs/kubelatch/commit/f48eaed94de4594dc4a9393ff18757ae2672d574))
* **rbac:** lock a deleted role's groups before revoking their permissions ([31e1b11](https://github.com/picaportelabs/kubelatch/commit/31e1b110ce981883ecd2f6c44692f3cd28715a8a))
* **rbac:** validate a grant batch before opening its transaction ([ee85c1d](https://github.com/picaportelabs/kubelatch/commit/ee85c1ddc9e0931a159f05c10792526f99f472a9))
* **store:** give the group advisory lock its own class, 12 ([575081c](https://github.com/picaportelabs/kubelatch/commit/575081c5f98322c5531aab0da72ac22101b957f5))
* **store:** groups down migration with agent grants, and tests for the sync revoke paths ([a4a859d](https://github.com/picaportelabs/kubelatch/commit/a4a859d60f2d457d669facc35edab04504005803))
* **store:** pair a derived grant only within one group ([28a172e](https://github.com/picaportelabs/kubelatch/commit/28a172e668cd4390861d45232afdf13ff044c8dd))

## [0.27.1](https://github.com/picaportelabs/kubelatch/compare/v0.27.0...v0.27.1) (2026-10-08)


### Bug Fixes

* **release:** read the release notes with GITHUB_TOKEN so the public mirror carries them ([d9dfab6](https://github.com/picaportelabs/kubelatch/commit/d9dfab62c30c445e08afad28cf9114a4ca8e11a7))

## [0.27.0](https://github.com/picaportelabs/kubelatch/compare/v0.26.0...v0.27.0) (2026-10-08)


### ⚠ BREAKING CHANGES

* **edition:** an instance that never had a license key keeps its audit 24 hours instead of 7 days; about a minute after the first start of this version the retention job deletes the older audit. Set KUBELATCH_LICENSE before upgrading, or install a key in Edition right after, to keep it. Nothing that exists is cut: an instance already past 2 clusters or 5 people keeps them and only new registrations are refused.

### Features

* **edition:** Free allows 2 clusters, 5 people and 24 hours of audit ([e53bfdc](https://github.com/picaportelabs/kubelatch/commit/e53bfdcec020accbd6ac07ee5dfc44aa5ff9f114))
* **landing:** pricing, the Pro pages, the key resend form, navigation and footer in both languages ([8155a73](https://github.com/picaportelabs/kubelatch/commit/8155a7347aa8278d2d2a24c8da2cd4aa0aa0308f))
* **landing:** re-root the landing as its own repository (Dockerfile, Makefile, README, CI) ([6abfb7c](https://github.com/picaportelabs/kubelatch/commit/6abfb7c5086c8b41b13ee08acfb2969df5e45603))
* **legal:** EULA as LICENSE and the terms, privacy and security pages in both languages ([7b8eca9](https://github.com/picaportelabs/kubelatch/commit/7b8eca9bab4b62bc9931205d5bb8b8c5f667a16c))
* **license:** seed helpers and an exported CurrentKID for the licensing service ([a2f6895](https://github.com/picaportelabs/kubelatch/commit/a2f68957f299dc9b6679c95ba8998acd6a6734e6))
* **licensing:** claims from a subscription, the signer, keygen and issue ([98a10ae](https://github.com/picaportelabs/kubelatch/commit/98a10ae6eb3eab61a28a5d1be2d429abb2ec9216))
* **licensing:** distroless image, operator README and a local Pro through make dev-tls-pro ([051d78b](https://github.com/picaportelabs/kubelatch/commit/051d78b17a681bd956c0210b3b63c21380743074))
* **licensing:** key and end-of-subscription e-mails in English and Spanish through Resend ([6a12054](https://github.com/picaportelabs/kubelatch/commit/6a120546562a96cbe0a1ba53bbe754599ea1ccf7))
* **licensing:** Stripe webhook signature, event envelope and REST client ([01136ca](https://github.com/picaportelabs/kubelatch/commit/01136ca1d055b07581ac6dcb6baaed53a57085d9))
* **licensing:** the service: Stripe webhook, key resend, healthz and serve ([ee48289](https://github.com/picaportelabs/kubelatch/commit/ee48289ce31107462332d234da7a7b45a54c840f))
* **public:** the public repository tree and deploy/public/sync.sh ([8d8fb10](https://github.com/picaportelabs/kubelatch/commit/8d8fb10f90895523861bc100b250a9f7f357972e))
* **release:** publish-public mirrors each release to picaportelabs/kubelatch; fixed image source ([6eaf44a](https://github.com/picaportelabs/kubelatch/commit/6eaf44a784414dcf8fa92efc3e4914d936780051))
* **release:** the EULA ships in the image and the chart ([40f1311](https://github.com/picaportelabs/kubelatch/commit/40f1311d5dfeded696fc99706cc47b6552a23bdd))
* **web:** the sidebar says the edition beside the name ([59b9cec](https://github.com/picaportelabs/kubelatch/commit/59b9cecff673af389d8b5a2adca697cdd68634e0))


### Bug Fixes

* **helm:** refresh the chart's EULA copy after the legal fixes ([58c5f8b](https://github.com/picaportelabs/kubelatch/commit/58c5f8b755c986cecd1f4a360205e1bd0c365a29))
* **landing:** let the key form follow its redirect back, 404 for /pro/, and stricter form and Stripe checks ([17e8307](https://github.com/picaportelabs/kubelatch/commit/17e830779c41d9e4a40152f7cbb37833e4d1e83c))
* **landing:** privacy names the key-request logs, the FAQ grace is for paid keys; tighter concurrency note and workflow test ([70a03cc](https://github.com/picaportelabs/kubelatch/commit/70a03cc929c030d1a76990006899f83cfb7fb923))
* **landing:** split the pricing FAQ on expiry and seats, name every licensing log field, fix the packages sentence and the closing checklist order ([98867da](https://github.com/picaportelabs/kubelatch/commit/98867da7e97e102acd8dc7a1c0852a589412ca3f))
* **legal:** bind trial users to the Pro Subscription Terms in EULA section 5 ([d01e84d](https://github.com/picaportelabs/kubelatch/commit/d01e84d49fac982c904d665440b0ce122a9aa221))
* **legal:** Free limits per Instance, Pro Seats across Instances, trial customers and (a) clause markers ([fe02836](https://github.com/picaportelabs/kubelatch/commit/fe0283616866574e896e381aea4d22d9e8d41a71))
* **licensing:** judge the status before the customer, cap --days, refuse empty Stripe ids, keep e-mails out of transport errors, tolerant locale match, IPv6 /64 limiter keys ([061b2b8](https://github.com/picaportelabs/kubelatch/commit/061b2b8752b3754e7dd3a2cfa29de1662ea76334))
* **licensing:** look resend addresses up as typed, then lowercase; trust the last X-Forwarded-For line ([0275cf8](https://github.com/picaportelabs/kubelatch/commit/0275cf8492b8fe430e30a0acaf672a56a85d36bd))
* **licensing:** paid keys only from paid events, trial-end updates only, price check, unpaid checkouts, per-address resend cap, event-dated keys ([698cbf6](https://github.com/picaportelabs/kubelatch/commit/698cbf6134e28dc3bf6194853372c0f0f30c1e28))
* **release:** pass PUBLIC_REPO_TOKEN through workflow_call, sync the public tree for the latest release only and one at a time, mirror the root files with deletion, point the public changelog at the public repository ([e569ce1](https://github.com/picaportelabs/kubelatch/commit/e569ce1ab8e399f2f0ed845fd223d158ddafdbd8))

## [0.26.0](https://github.com/picaportelabs/kubelatch/compare/v0.25.0...v0.26.0) (2026-10-08)


### Features

* **api:** GET /api/edition, the license install and remove, and me.edition ([357110d](https://github.com/picaportelabs/kubelatch/commit/357110d516ead577ebd8f3517a7a004dd369d618))
* **auth:** the Free people cap on invitations, the CLI and re-enabling ([3c1ff4b](https://github.com/picaportelabs/kubelatch/commit/3c1ff4b3567054c6161de6132ae7918c3a09a891))
* **cli:** kubelatch-server license show and verify ([6364b45](https://github.com/picaportelabs/kubelatch/commit/6364b4581ea391960b965a5eb278bc0ebfc674c6))
* **clusters:** the Free cluster cap on registration ([48ddb81](https://github.com/picaportelabs/kubelatch/commit/48ddb81bebeb4ab17a697f7e9dd749165b73e8eb))
* **config:** KUBELATCH_LICENSE, the edition wired at startup and the retention capped by it ([219db3d](https://github.com/picaportelabs/kubelatch/commit/219db3d4cce0290a81bffd30a1d4ba3377b170fe))
* **edition:** the edition state machine, its caps and the edition.* error codes ([b5989c0](https://github.com/picaportelabs/kubelatch/commit/b5989c09c00ea9070c0e51dcb2d581023df3465a))
* **edition:** the service that loads, verifies and refreshes the key and checks the caps ([f4235cf](https://github.com/picaportelabs/kubelatch/commit/f4235cf8a6e786e4eae2516e08ad02512ec87ab5))
* **httpapi:** the audit is served 7 days back in Free and lapsed instances ([2d84d93](https://github.com/picaportelabs/kubelatch/commit/2d84d9318786a0dadf13da9325f61f3f282b4cee))
* **license:** the Pro licence key format, verified offline with embedded keys ([1bd8dda](https://github.com/picaportelabs/kubelatch/commit/1bd8dda9f80b9cd4077ba6f4cf28b5f1bc4eb94f))
* **rbac:** custom roles are created and edited in Pro only ([7f40dc4](https://github.com/picaportelabs/kubelatch/commit/7f40dc409b595f68d9005858f53ec603a98620c3))
* **server:** the startup log says the seats and the expiry of the key ([7f9ca39](https://github.com/picaportelabs/kubelatch/commit/7f9ca39db385a1b73a32df36ff37d0ae38e90f1d))
* **store:** the licenses row, the people and cluster counts and their locks ([19686f5](https://github.com/picaportelabs/kubelatch/commit/19686f5b191d82a90c067d954de4fa9bc96da0a9))
* **web:** edition notices in the bell and banners where a cap bites ([ecff7ab](https://github.com/picaportelabs/kubelatch/commit/ecff7abab587c5c53c7edb356d2e8a452df28adf))
* **web:** the Edition page, its texts and its navigation entry ([6339176](https://github.com/picaportelabs/kubelatch/commit/6339176bf760362b4a863cd807c46010a90d8081))


### Bug Fixes

* **api:** the edition view reports over_seats only while a paid key with seats is in force ([a2b726a](https://github.com/picaportelabs/kubelatch/commit/a2b726a009ef272c141f55266ca67792941f22f7))
* **auth:** the people lock before the subject is read on re-enable, the CLI reads the edition only on create ([a7bd886](https://github.com/picaportelabs/kubelatch/commit/a7bd886c994c741deb56a8a1502f9985ea13f390))
* **cli:** license verify never echoes the key and refuses an untrusted signer, with tests ([a3cc4ef](https://github.com/picaportelabs/kubelatch/commit/a3cc4ef12a6385c6b880729c4c047e81c3769d31))
* **config:** the effective retention in the startup log, license spelled the US way, comments ([ab76577](https://github.com/picaportelabs/kubelatch/commit/ab76577acf5439dec50a7a613c1857bd0241c2b1))
* **edition:** a removal reads the license row locked, so the event names the key it removed ([d67250d](https://github.com/picaportelabs/kubelatch/commit/d67250d416a7f238e72c135cb3b4adfd2653c1d6))
* **edition:** a sealed key that cannot be opened runs as Free, one refresh at a time, the remove event names the removed key ([0454545](https://github.com/picaportelabs/kubelatch/commit/0454545ee425f68d7577634826286652333a943e))
* **edition:** an instance that had a key keeps its configured retention after the key is removed ([8f19103](https://github.com/picaportelabs/kubelatch/commit/8f19103383b80eb4a4033f609eee5032f81c17e3))
* **edition:** one retention predicate, trial keys never over seats, no nil claims in Warnings ([bfc5f3f](https://github.com/picaportelabs/kubelatch/commit/bfc5f3ff6cb1299b4bc2de16dfc37cce7876eb46))
* **edition:** people_at_limit waits for the seats to be enforced, as the cap does ([dd1a701](https://github.com/picaportelabs/kubelatch/commit/dd1a701b2ebe93e84572b1803632c5792da732fb))
* **edition:** pin the grace boundaries, keep audit with an unusable key, fail closed on unknown resources ([f9633c3](https://github.com/picaportelabs/kubelatch/commit/f9633c3e810c787dc2291c12ab2c3ba9f1e973a6))
* **edition:** removing the license key records license.remove even when there was no key to remove ([7e7320a](https://github.com/picaportelabs/kubelatch/commit/7e7320af9fb89ef0b6e0213a46dd438de5b3977a))
* **httpapi:** the audit floor also applies to the agent session timeline ([ee4cd85](https://github.com/picaportelabs/kubelatch/commit/ee4cd8537abbd308dc680bfc0c8f8387dc5db5ba))
* **httpapi:** the audit floor also applies to the event detail ([4c58dd4](https://github.com/picaportelabs/kubelatch/commit/4c58dd4db00f9b8e6a032100986afbca92fc6f35))
* **license:** tolerate clock skew on nbf, times in UTC, and keep .local out of image builds ([a5e02eb](https://github.com/picaportelabs/kubelatch/commit/a5e02ebbb6665b1982871977069af1fc2c37e013))
* **store:** lock_timeout on the licenses migration, the over-seats mark survives key changes, sturdier lock test ([143df8a](https://github.com/picaportelabs/kubelatch/commit/143df8a0d8327c73cf46fa223a0f832bba3cae4b))
* **web:** edition notes follow the action that moved them ([eaa7d87](https://github.com/picaportelabs/kubelatch/commit/eaa7d871b04c45cfada9f79185b8e14679b6fc7a))
* **web:** role saves and deletes refresh the edition usage, and the agent session timeline says since when it is served ([a316c2f](https://github.com/picaportelabs/kubelatch/commit/a316c2f2ac9f4672b8bf3e836ac32c9659e24650))
* **web:** the control log says when a license removal found no key ([dd342f3](https://github.com/picaportelabs/kubelatch/commit/dd342f3a2d1cb470b73719d81828e930e9f6ee3e))
* **web:** the Edition page lets go of the pasted key and covers lapsed, grace and trial ([66eab51](https://github.com/picaportelabs/kubelatch/commit/66eab5105cbdd2368c10564390bb7f5d2cac2aa1))
* **web:** the removal title reuses the button's verb in Spanish, and one exact assertion ([91ad665](https://github.com/picaportelabs/kubelatch/commit/91ad6657fee421e4ef29b220da661b9b40ff005f))
* **web:** the resource lookup of edition.limit falls back to the raw name for the type checker ([7f921ec](https://github.com/picaportelabs/kubelatch/commit/7f921eca9a805d72314ee903ec158105e346345d))

## [0.25.0](https://github.com/picaportelabs/kubelatch/compare/v0.24.0...v0.25.0) (2026-10-06)


### Features

* **landing:** screenshots of the Agents page and the authorization in the agents band ([b056dd7](https://github.com/picaportelabs/kubelatch/commit/b056dd7a7548ea25125df8c390f5f2a5a74ac9e2))
* **landing:** the proof on /agents/, the story on the home ([e66a84a](https://github.com/picaportelabs/kubelatch/commit/e66a84a924239adad6870d90c9a3b18c485f937c))


### Bug Fixes

* **landing:** the agents band as two rows in a zigzag ([97f00e6](https://github.com/picaportelabs/kubelatch/commit/97f00e6bce84e646368f8acb065bdd7be974ead5))

## [0.24.0](https://github.com/picaportelabs/kubelatch/compare/v0.23.0...v0.24.0) (2026-10-06)


### Features

* **agents:** a delegated agent asks its person for access, up to their own role ([1d8431e](https://github.com/picaportelabs/kubelatch/commit/1d8431e977236b5e3212a3621945b4967614def9))
* **agents:** a finished write request keeps no Secret values ([af08693](https://github.com/picaportelabs/kubelatch/commit/af086938145b5acbe214e497dbe23f218ff7fb47))
* **agents:** access requests and decisions, approved through rbac ([1ec3437](https://github.com/picaportelabs/kubelatch/commit/1ec343746c3be19c4125939aaca2ba20ecdc3c81))
* **agents:** cut a session, the bot's approval switch, scoped listings ([eda8a13](https://github.com/picaportelabs/kubelatch/commit/eda8a1306a3b9d8cfccb50cdb5a8f5a78f129626))
* **agents:** cutting a delegated session revokes its refresh tokens; kubelatch can cut one itself ([6be0271](https://github.com/picaportelabs/kubelatch/commit/6be027148798adf8e3575afb7ac6d12313a9a831))
* **agents:** delegated sessions start from a person's consent, bounded by their grants ([cf5afb0](https://github.com/picaportelabs/kubelatch/commit/cf5afb01773f8e1b2d9633e7a68fd5626779eb39))
* **agents:** start a bot's agent session on first use ([a437c75](https://github.com/picaportelabs/kubelatch/commit/a437c75b579de24722076559f499114cd654a51e))
* **agents:** write requests held for approval and claimed once ([c97e1f7](https://github.com/picaportelabs/kubelatch/commit/c97e1f76e3f1a4be098c0e3671cbbb4cf26d1146))
* **api:** agent requests: list, detail, approve and deny; the bot's approval switch ([0d258de](https://github.com/picaportelabs/kubelatch/commit/0d258de48cca98e01580abb4799f012aebae2519))
* **api:** agent sessions: list, detail, timeline and cut ([0a8c291](https://github.com/picaportelabs/kubelatch/commit/0a8c291d573d588840a3b7eeb5902ef9171fff99))
* **apierr:** codes of delegated agent sessions and their consent ([f794f27](https://github.com/picaportelabs/kubelatch/commit/f794f27b530e6e0a001ff0356d09d506256e248f))
* **apierr:** error codes of agent sessions, requests and approvals ([1ecb895](https://github.com/picaportelabs/kubelatch/commit/1ecb895ad8c023dba1edb87a352042af4d3194fd))
* **audit:** record and filter by agent session and MCP tool ([8dcfbe8](https://github.com/picaportelabs/kubelatch/commit/8dcfbe8db8904f1b2d1e7e0ed857d07c07ab5d2c))
* **config:** agent session duration and its maximum ([f5564cb](https://github.com/picaportelabs/kubelatch/commit/f5564cb951649f95661c35b3cecd7268866a3656))
* **httpapi:** a person's consent to an agent, and the ceiling of delegated sessions ([7cf136d](https://github.com/picaportelabs/kubelatch/commit/7cf136d47bf330fcf55e9d718cb2d61b534c5eb6))
* **httpapi:** the OAuth endpoints of delegated agents, outside /api ([1aef11f](https://github.com/picaportelabs/kubelatch/commit/1aef11f15e71bec3f3b3c622b413fb0752abadfb))
* **integrations:** a Claude Code plugin with kubelatch's MCP server and the rules, and the repository as its marketplace ([5cd769b](https://github.com/picaportelabs/kubelatch/commit/5cd769bb9cdf39c038b9b590ffd4891cf353b455))
* **integrations:** a hook that stops direct kubectl, helm and k9s and names the kubelatch tool ([c9adbfc](https://github.com/picaportelabs/kubelatch/commit/c9adbfcbab66c6fa212f7c167dc140f3942a0197))
* **integrations:** the rules that point an agent at kubelatch's MCP tools, for AGENTS.md and Cursor ([680f147](https://github.com/picaportelabs/kubelatch/commit/680f147ec3692c07c5019a0ccdf877062edf047b))
* **jobs:** expire and delete closed agent requests with the audit retention ([3081d63](https://github.com/picaportelabs/kubelatch/commit/3081d6357296fe7e35f2d08135bc7940c1a95574))
* **landing:** a page for AI agents in both languages, its share images, and its smoke checks ([f1d5222](https://github.com/picaportelabs/kubelatch/commit/f1d5222a47bdf8dbfcf677869ded2420a8ee5978))
* **landing:** agents video as a coding agent's terminal, with the MCP rows visible ([80660fd](https://github.com/picaportelabs/kubelatch/commit/80660fd59e9f390bc40939b35f979b612923f0da))
* **landing:** AI agents move up, with their video, what the agent sees, the connect line and the three ways ([3e4eae2](https://github.com/picaportelabs/kubelatch/commit/3e4eae2f61587c016549d8782a09d1bc9fb5e9ac))
* **landing:** the agents video, and render.sh for both landing videos ([10dbe4d](https://github.com/picaportelabs/kubelatch/commit/10dbe4d7e5f4a6111037c73043effd3079a7aba1))
* **landing:** the home sums up the agents feature; /agents/ holds the detail ([399df16](https://github.com/picaportelabs/kubelatch/commit/399df1625aa3928db39f2b5c8f0d945c26244456))
* **landing:** the problem opens the home; the agents summary is a dark band after what you get ([2ac52e7](https://github.com/picaportelabs/kubelatch/commit/2ac52e7680f1f847cd21613584ba9f600ba57c66))
* **mcp:** /mcp endpoint for bots with whoami and list_clusters ([24742b2](https://github.com/picaportelabs/kubelatch/commit/24742b23c9049e38ee92d1eb654ea5d77c893737))
* **mcp:** apply, delete_resource, scale and rollout_restart through proxy.Do ([e0af051](https://github.com/picaportelabs/kubelatch/commit/e0af0518a0ffdeca58d8a7011c734aa15d142f97))
* **mcp:** cluster requests through the proxy, discovery and list_api_resources ([0b6c1a5](https://github.com/picaportelabs/kubelatch/commit/0b6c1a5b879b7abd2e549d661829400082c4855a))
* **mcp:** delegated agents sign in by OAuth, with the RFC 9728 challenge on every 401 ([c764ad7](https://github.com/picaportelabs/kubelatch/commit/c764ad73c06095abf00c8a52637553f1d69a6c5b))
* **mcp:** get_logs ([41e6757](https://github.com/picaportelabs/kubelatch/commit/41e6757b2669a1687883b5bc9b09c71a8332a057))
* **mcp:** get_resource with Secret redaction, and read_secret ([64779bd](https://github.com/picaportelabs/kubelatch/commit/64779bd7330bb473192833ebd74f1b6853faef19))
* **mcp:** hold writes for approval and run the stored request once ([1332ba7](https://github.com/picaportelabs/kubelatch/commit/1332ba7f4c3843a3a95e06a65a43b2f76d71ea53))
* **mcp:** list_resources and get_events ([f635a36](https://github.com/picaportelabs/kubelatch/commit/f635a36e39645f44c52fed05b19da7849470a413))
* **mcp:** request_access for bots, and point the agent at it ([2c1cb40](https://github.com/picaportelabs/kubelatch/commit/2c1cb40de2353584ecafc723b0bc19b771c3d381))
* **oauth:** authorization server and protected resource metadata ([78c5e8e](https://github.com/picaportelabs/kubelatch/commit/78c5e8ea8950a2b77950097c8cc1ff0960e73b51))
* **oauth:** client registration, authorization requests and the person's consent ([28a631c](https://github.com/picaportelabs/kubelatch/commit/28a631c179bc995795ff14d14b2044b2307d7563))
* **oauth:** code exchange with PKCE, rotating refresh tokens, revocation ([abcffcd](https://github.com/picaportelabs/kubelatch/commit/abcffcdb8ff2e2af9600c13cf33542b190e2e776))
* **oauth:** fetch client metadata documents over https from public addresses only ([669cdbe](https://github.com/picaportelabs/kubelatch/commit/669cdbe5481d639d952106b36507678cf42b0334))
* **oauth:** redirect URI rules and the canonical resource ([711ae1d](https://github.com/picaportelabs/kubelatch/commit/711ae1d46cee68d71bac33c846a96ba9e7b1dd2e))
* **proxy:** a delegated agent session is sent only its derived grants' groups ([ef41cf4](https://github.com/picaportelabs/kubelatch/commit/ef41cf4cd1a139cde3aa002c7562ca15382dfa55))
* **rbac:** developer scales deployments, statefulsets and replicasets ([a7fbcda](https://github.com/picaportelabs/kubelatch/commit/a7fbcda3abc516a0814705a750ebac35ead866f8))
* **rbac:** roles that write, grant shape checks and a pre-commit hook ([8021d14](https://github.com/picaportelabs/kubelatch/commit/8021d145415dad5f202cd459d3d72c5c64c5e8ca))
* **rbac:** the roles a delegation may derive, and derived grants in the reconcile pass ([2ff5c91](https://github.com/picaportelabs/kubelatch/commit/2ff5c9115d28a98e6d8251f81f07615daf66777f))
* **server:** mount /mcp, with KUBELATCH_MCP_ENABLED and KUBELATCH_MCP_RATE_LIMIT ([96798fe](https://github.com/picaportelabs/kubelatch/commit/96798fe022597b65b8e82af917172ef34887e28d))
* **server:** mount the OAuth server and clean its rows hourly ([b9d66d3](https://github.com/picaportelabs/kubelatch/commit/b9d66d30c33b8cd75d621e27167c1ccd439dd41e))
* **store:** agent request outcome and the agent session timeline index ([97e9257](https://github.com/picaportelabs/kubelatch/commit/97e9257029127607b8e01689b4d24ba6347cf84c))
* **store:** agent requests: decide, claim once, elevation, expiry ([cbcb7ab](https://github.com/picaportelabs/kubelatch/commit/cbcb7ab30bfc6ec40f0c8e1e6eb6768ca611e27a))
* **store:** agent sessions and the audit columns for MCP ([179d608](https://github.com/picaportelabs/kubelatch/commit/179d6082f771bc21ed56b8db5f827e244bda9569))
* **store:** derived grants of delegated agent sessions, in the reconciler's input ([041737c](https://github.com/picaportelabs/kubelatch/commit/041737c63b3bbdf150e43abe8f03d8e752fc1c51))
* **store:** list agent sessions and set a bot's approval switch ([55ded4e](https://github.com/picaportelabs/kubelatch/commit/55ded4ed03d9ce3846aa6732bf5d858599a0547f))
* **store:** oauth clients, authorizations and refresh tokens, and the derived grant bound ([b58b6e0](https://github.com/picaportelabs/kubelatch/commit/b58b6e092d8ed28a8b74b43e52b84cf6858d7420))
* **web:** a bot's AI agent sheet with its approval switch and connect dialog ([1ae0e3e](https://github.com/picaportelabs/kubelatch/commit/1ae0e3e5210a6bc13dfeaa03cf2f85de254c9c3a))
* **web:** a delegated session's ceiling and who decides its requests ([4074b0b](https://github.com/picaportelabs/kubelatch/commit/4074b0b357d0e7555a4c7891e91ca4ebe5602a6f))
* **web:** agent types, query keys, helpers and texts ([e411a88](https://github.com/picaportelabs/kubelatch/commit/e411a88791cc7ca398ec11ab0537d9da1e3b1120))
* **web:** Agents in the sidebar with its pending count, and the bell for everyone ([300263f](https://github.com/picaportelabs/kubelatch/commit/300263ff53f6702abdf02964da7fb6d6a0cdf8e9))
* **web:** an agent request's page with its diff, approve and deny ([3e94f1a](https://github.com/picaportelabs/kubelatch/commit/3e94f1a4532e0b74299c0d7a4908ebc715a877ef))
* **web:** an agent session's page with its permissions and timeline ([965e69c](https://github.com/picaportelabs/kubelatch/commit/965e69c7098d6aafec034457727055a8f56dc3b9))
* **web:** connect your own agent from Home ([6730d22](https://github.com/picaportelabs/kubelatch/commit/6730d22dd608f087966dc905b59be46e5d2a8b1c))
* **web:** filter the audit by agent session and MCP tool ([b3b8a54](https://github.com/picaportelabs/kubelatch/commit/b3b8a545bcb0dfb3ed32298c72a1a7fc512f0559))
* **web:** the Agents page with its sessions and requests ([9a55565](https://github.com/picaportelabs/kubelatch/commit/9a55565b1f5d88203155f43182e68d8f66890e69))
* **web:** the consent page of a delegated agent ([0c8d538](https://github.com/picaportelabs/kubelatch/commit/0c8d5384d716cf54ba5dea5d20685853e65e833b))
* **web:** types, helpers and texts of delegated agent sessions ([6f5e605](https://github.com/picaportelabs/kubelatch/commit/6f5e605dcc4d80a788ed5b65927214ccb06b0ff4))


### Bug Fixes

* **agents:** cutting a session revokes the grants it was given on request ([d1863ee](https://github.com/picaportelabs/kubelatch/commit/d1863ee29f3c8f9111f1d17291ebf179c5a9f003))
* **agents:** expire and scrub lapsed writes even with audit retention off ([86b2cb0](https://github.com/picaportelabs/kubelatch/commit/86b2cb0a8ce751db677ff410d605b13ffcf27ef9))
* **agents:** only a writing elevation in effect lifts per-write approval ([3dbf857](https://github.com/picaportelabs/kubelatch/commit/3dbf8571a4402a984528ab0fcaaf2f19b3b3e7f0))
* **agents:** seal the body of every held write at rest ([54e8834](https://github.com/picaportelabs/kubelatch/commit/54e8834953e9c8252306e7698b6569a504023aaf))
* **agents:** take a bot session's writes_need_approval from the bot on every request ([6c3f275](https://github.com/picaportelabs/kubelatch/commit/6c3f275ae869dfa77755fe7360921afd66dbb235))
* **auth:** a session revoked meanwhile no longer aborts a disable ([b285e6f](https://github.com/picaportelabs/kubelatch/commit/b285e6fca3471525bac1bf9a040b9fa3f81f816b))
* **auth:** disabling a person cuts their delegated agent sessions ([be7fa77](https://github.com/picaportelabs/kubelatch/commit/be7fa77f5935162bd788b0fd11d71b5cad02566d))
* **integrations:** close the hook's bypasses and tell the docs what the code does ([47ab14c](https://github.com/picaportelabs/kubelatch/commit/47ab14c888c39ecfe845c083e89b66c5db64d002))
* **jobs:** the retention records the sessions it revokes for an unexchanged code ([229dc21](https://github.com/picaportelabs/kubelatch/commit/229dc21bd515ebcc5950dea8bfbcc670634cefbc))
* **mcp:** audit a request without a bearer token ([fcb8835](https://github.com/picaportelabs/kubelatch/commit/fcb8835482090befa9290a3183b7da7b05a8eccf))
* **mcp:** hold no write whose preview would be cut, and flag a whole diff ([8190355](https://github.com/picaportelabs/kubelatch/commit/8190355288636cb2673e509eebcb515daf10f1c6))
* **mcp:** one revoked-session message, and the rate limit before reading the body ([a158d4d](https://github.com/picaportelabs/kubelatch/commit/a158d4d77120b0b0c38a4a2853cbca40bfffc4f2))
* **mcp:** rate limit before the agent session ([60c2a64](https://github.com/picaportelabs/kubelatch/commit/60c2a646d747c70aec926b9ffb28609d97cb21c3))
* **mcp:** refuse JSON-RPC batches ahead of the rate limit ([bcc2e10](https://github.com/picaportelabs/kubelatch/commit/bcc2e1060aa7994edf1db1a1aaee2334bfcf777d))
* **mcp:** report only the grants that take effect in whoami and list_clusters ([c0151ca](https://github.com/picaportelabs/kubelatch/commit/c0151ca9dbe2f1e073a448cf8e9920128aea7d0a))
* **mcp:** request_access holds to the credential's cluster restriction ([eaa6f4c](https://github.com/picaportelabs/kubelatch/commit/eaa6f4c52ef60dc109641d861f5065e087c8e2c6))
* **mcp:** serve a public Host that arrives over loopback ([575c1d3](https://github.com/picaportelabs/kubelatch/commit/575c1d37a8d66815ae6d686df4302ed5bbc8970d))
* **oauth:** a DCR client's authorize errors never redirect ([0d26c2f](https://github.com/picaportelabs/kubelatch/commit/0d26c2feab9b578f7da9d8d37a59e6dbc1b049ad))
* **oauth:** new CIMD clients count against the client cap and are recorded ([6c9670a](https://github.com/picaportelabs/kubelatch/commit/6c9670a466a6e823648ec448f8f4195320bdacf3))
* **oauth:** no authorize error redirects, whatever the client's origin ([39ce22f](https://github.com/picaportelabs/kubelatch/commit/39ce22f69ecd386ef16d29e8a235db513bb2bef4))
* **proxy:** recheck the credential, subject and agent session on every Do ([a54c72c](https://github.com/picaportelabs/kubelatch/commit/a54c72ccde9f0011723233d258eca65cfc825a17))
* **store:** cascade agent sessions with their credential, and their rows with them ([b4260dd](https://github.com/picaportelabs/kubelatch/commit/b4260ddf4a3cd8705b3086555e8ff70f9cb6a698))
* **store:** stamp agent sessions' last_used_at ([6fef4de](https://github.com/picaportelabs/kubelatch/commit/6fef4de2b4c3e1522779635c5fc740e325dbd847))
* **web:** focus lands on the details after cutting a session or deciding a request ([71c98b8](https://github.com/picaportelabs/kubelatch/commit/71c98b82bf8351b9560f5be16303d2e7a4b34c30))
* **web:** keep the consent default's comment free of Spanish quotes ([048bec3](https://github.com/picaportelabs/kubelatch/commit/048bec303e653e5de41c77889ca82e3599301ade))
* **web:** leave out by default the grants an agent cannot take read-only ([753dac0](https://github.com/picaportelabs/kubelatch/commit/753dac01b2e98c3e1a93e24eed24b04165d81861))

## [0.23.0](https://github.com/picaportelabs/kubelatch/compare/v0.22.0...v0.23.0) (2026-10-05)


### Features

* **apierr:** error codes of the custom roles API and of granting a custom role ([152e653](https://github.com/picaportelabs/kubelatch/commit/152e6530359832e35d64fed81070ead8afec4da9))
* **api:** grants carry role, with tier as a deprecated alias ([ac55d90](https://github.com/picaportelabs/kubelatch/commit/ac55d904cd7d42a2265e6fe9a0c1a3088bf52f3e))
* **clusters:** bootstrap v2, the reconciler bounded by an admission policy ([a8111c7](https://github.com/picaportelabs/kubelatch/commit/a8111c71a6904e13894969296172e8865b912e38))
* **clusters:** discover a cluster's API resources, cached five minutes ([4b79292](https://github.com/picaportelabs/kubelatch/commit/4b7929251f45ece2207c5bc24d1878b027c8160a))
* **httpapi:** custom roles API, role catalogue, cluster discovery and bootstrap_version ([79abd87](https://github.com/picaportelabs/kubelatch/commit/79abd8774b8c2fbf2383195c1d8c95fa8bc812af))
* **rbac:** create, edit, delete and preview custom roles ([293cd96](https://github.com/picaportelabs/kubelatch/commit/293cd96e7ed598859d72d87b16b61522f0ff1ca2))
* **rbac:** deleting a cluster removes its custom roles ([54880cc](https://github.com/picaportelabs/kubelatch/commit/54880ccf903ede85ea72a4c2b970a599bbf8a625))
* **rbac:** effective rules, risk and PSA of a custom role ([14f0ebb](https://github.com/picaportelabs/kubelatch/commit/14f0ebba188e71eed130473a5ed0a8f684f8b327))
* **rbac:** grant a custom role, locked against its deletion ([6cf6013](https://github.com/picaportelabs/kubelatch/commit/6cf6013fb708a1995b1d6c40960163daa3fa2dcb))
* **rbac:** the catalogue of permission modules ([24db344](https://github.com/picaportelabs/kubelatch/commit/24db3447a6ca7811a767ee5b0970f62ce9e2a8f6))
* **rbac:** the desired state of a cluster includes its custom roles ([337b7ae](https://github.com/picaportelabs/kubelatch/commit/337b7ae609113ef7ed14a5d1d48a96ec1667fd0a))
* **rbac:** the reconciler detects the bootstrap and materialises custom roles ([1081505](https://github.com/picaportelabs/kubelatch/commit/10815051c9df5e9add15f08551eb3072b9fc7995))
* **rbac:** validate a custom role against the policy ([bbcf2ef](https://github.com/picaportelabs/kubelatch/commit/bbcf2efe51928a6fca003bbf089f72fcb1052f2c))
* **store:** grants name a role, with tier kept in sync for the rollout ([9c70d1a](https://github.com/picaportelabs/kubelatch/commit/9c70d1a1ec7a33e2141de35eca06b377efc845b9))
* **store:** record which bootstrap a cluster has ([bd4419a](https://github.com/picaportelabs/kubelatch/commit/bd4419a68d09bec318f16df192169de37fd8c1fb))
* **store:** the roles table ([59bb0d0](https://github.com/picaportelabs/kubelatch/commit/59bb0d097f8c176eb28708274807e350df8e9a09))
* **store:** update, lock, soft delete and usage of custom roles ([ef304bf](https://github.com/picaportelabs/kubelatch/commit/ef304bf2d462eca2d8b8643ac873b906c15b83f3))
* **web:** grant a custom role, and name roles in the grant lists ([57aa1f1](https://github.com/picaportelabs/kubelatch/commit/57aa1f15fb24c801a1c5535c7a05160e1deb8c69))
* **web:** New role and the roles by name in the command palette ([76553ab](https://github.com/picaportelabs/kubelatch/commit/76553ab67a01e0070b7dce9e6306b769228a1d69))
* **web:** read and send a grant's role ([c4f86fc](https://github.com/picaportelabs/kubelatch/commit/c4f86fcf3e3b364630bafc655ba54fb82faf4081))
* **web:** role types, API calls, fixtures and texts for custom roles ([ee793f3](https://github.com/picaportelabs/kubelatch/commit/ee793f3a087fc3ce5d731c1b7f22b2aa6b581c0a))
* **web:** Roles page and role builder ([f780a2e](https://github.com/picaportelabs/kubelatch/commit/f780a2ed487121580fb40b727202d6d1246ef90e))
* **web:** the cluster card offers to update a v1 bootstrap ([bc59ab5](https://github.com/picaportelabs/kubelatch/commit/bc59ab551be8f122e7f7f5939de852f6e6c8e132))


### Bug Fixes

* **apierr:** a protected namespace takes no permissions of any role, not tier ([c4ea478](https://github.com/picaportelabs/kubelatch/commit/c4ea4789e8df4caf18ab31dcef592b51a85068a6))
* **e2e:** the upgrade stage finds the previous release in git and adapts to its bootstrap ([bf87884](https://github.com/picaportelabs/kubelatch/commit/bf878849a6d2baef78bf20fb3aba569c433087c6))
* **httpapi:** hide role usage and clusters from non-admins; no 500 after a commit ([63179c6](https://github.com/picaportelabs/kubelatch/commit/63179c6cffc2014334fe349b92a3d3575684d5d0))
* **rbac:** a weakened jail policy is no jail, and other leftovers ([4b6bbfa](https://github.com/picaportelabs/kubelatch/commit/4b6bbfa53b2a08ae882e9c83f0d60a96b0510973))
* **rbac:** an edit cannot make a role granted on namespaces require PSA ([3bbde1d](https://github.com/picaportelabs/kubelatch/commit/3bbde1dda1ce703b258a9db4d6d660f44643d77e))
* **rbac:** close the gaps the milestone review found in role validation ([9d89631](https://github.com/picaportelabs/kubelatch/commit/9d8963199d0c16fdefa3b068823458796f5a1312))
* **rbac:** grant.psa_required names a role, not a tier ([995c69a](https://github.com/picaportelabs/kubelatch/commit/995c69ad7bc75e70e59fcba2861bddc410c73411))
* **rbac:** record the bootstrap version with the pass's outcome, not before ([e3c307e](https://github.com/picaportelabs/kubelatch/commit/e3c307e5138f89a3f4de90fc8ee9ad083b023ad5))
* **rbac:** serialise role creates so the 200-role limit holds ([ac17d18](https://github.com/picaportelabs/kubelatch/commit/ac17d18dca946b6c0ba5f8c449d08b6ec583ec4c))
* **rbac:** the proxy and the reconciler share which grants take effect ([a42dc3c](https://github.com/picaportelabs/kubelatch/commit/a42dc3cb0e23eda55e9c3f5c9021268a7744cac3))
* **rbac:** validate a role's cluster_ids ([570c034](https://github.com/picaportelabs/kubelatch/commit/570c03466b903b8464c065b06e7f93f33a8ac825))
* **store:** lock timeout on the role migration's down, and a roomier lock test ([b0ace64](https://github.com/picaportelabs/kubelatch/commit/b0ace6422462edd88a3f155164f861527ef11745))
* **store:** lock timeout, star-scope check and migration tests for the role rename ([047e609](https://github.com/picaportelabs/kubelatch/commit/047e609bb60295f9c2b147c93642562b8adc8a57))
* **web:** a role the cluster cannot take marks the role, not the date ([06dd0d4](https://github.com/picaportelabs/kubelatch/commit/06dd0d4ed59f02b7c1be94ebfdc04c0480cfad83))
* **web:** an edit saves only on the preview of the draft on screen ([ecdfd21](https://github.com/picaportelabs/kubelatch/commit/ecdfd21485b10fbd7471848bbdff8420ad3374ab))
* **web:** name custom roles by their display name wherever a person reads them ([8e90798](https://github.com/picaportelabs/kubelatch/commit/8e90798a67715b4133902fcd99e944252c82dcb8))
* **web:** send tier and read either field while the rename is in its expand window ([56e52d2](https://github.com/picaportelabs/kubelatch/commit/56e52d27b2ffef0b670ff9629a943774ac59b120))
* **web:** system roles show their capabilities, and a duplicate of one is a full custom role ([a02e00e](https://github.com/picaportelabs/kubelatch/commit/a02e00e54a555609c1707d2b6024e952054f2f3f))
* **web:** the builder says when its clusters fail to load, and the explorer offers subresources ([a2fb61e](https://github.com/picaportelabs/kubelatch/commit/a2fb61ecd4dba43e0086df01c3adb89765466147))
* **web:** the role builder caps name and description at the server's limits ([e50e53d](https://github.com/picaportelabs/kubelatch/commit/e50e53d8b46994375104a0c4e6eb6d3fbf876710))
* **web:** the role builder's Save is the page header's action ([ae3f769](https://github.com/picaportelabs/kubelatch/commit/ae3f7697e7445903ae4269e5ccbc4ffe3ad95fed))
* **web:** the role delete dialog names every active grant, disabled accounts' too ([205a687](https://github.com/picaportelabs/kubelatch/commit/205a687b1680cb2011c0cc9558e73e1982016940))
* **web:** updating a v1 cluster's bootstrap keeps its tokens, and says so ([cfb9993](https://github.com/picaportelabs/kubelatch/commit/cfb9993818844f363793762595c2ad5634179258))

## [0.22.0](https://github.com/picaportelabs/kubelatch/compare/v0.21.0...v0.22.0) (2026-10-03)


### Features

* **web:** warn to check the kubectl context before confirming enrollment ([2d15571](https://github.com/picaportelabs/kubelatch/commit/2d1557194efa9e8915451374e6af6fb669d63f6c))


### Bug Fixes

* **web:** ask for the kubectl context in the enrollment dialog ([1bd23e0](https://github.com/picaportelabs/kubelatch/commit/1bd23e0059b6060b12acb2177638b3a9bf533d5a))

## [0.21.0](https://github.com/picaportelabs/kubelatch/compare/v0.20.0...v0.21.0) (2026-10-03)


### Features

* **landing:** the cover video in Spanish on the Spanish page ([7070756](https://github.com/picaportelabs/kubelatch/commit/70707569afbe0f645e2efc363fccdcd3b2302d5e))

## [0.20.0](https://github.com/picaportelabs/kubelatch/compare/v0.19.1...v0.20.0) (2026-10-03)


### Features

* **auth:** log lockouts and rate-limit refusals at warn ([99db1d1](https://github.com/picaportelabs/kubelatch/commit/99db1d10e6599ed82b53f16f8fee41456bb9d4aa))
* **cli:** per-command help from a command table ([cb37bfb](https://github.com/picaportelabs/kubelatch/commit/cb37bfb34d7407192d67fa079129419a40425d15))
* **clusters:** create, inspect, revoke and consume enrollments ([ee57ac4](https://github.com/picaportelabs/kubelatch/commit/ee57ac45246110b082cc2287f8faa53dd1111600))
* **clusters:** enrollment script, and --flatten for a CA kept in a file ([402e383](https://github.com/picaportelabs/kubelatch/commit/402e3832a306d78951cab2c3a66d8552325fd553))
* **config:** log level and format, with request and audit ids from the context ([1bacf47](https://github.com/picaportelabs/kubelatch/commit/1bacf4708cf429c933cde0694eb7d3f486b9da2f))
* **helm:** config.logLevel and config.logFormat ([8f9e6d5](https://github.com/picaportelabs/kubelatch/commit/8f9e6d5fb7370c61791f29fecc9823845e3d0915))
* **httpapi:** access log and X-Request-Id ([6827182](https://github.com/picaportelabs/kubelatch/commit/6827182d2aa2f2438605e352cce2fe26bc4dffa4))
* **httpapi:** enrollment endpoints for curl | sh cluster registration ([41d503e](https://github.com/picaportelabs/kubelatch/commit/41d503e2d1066fe48c98cf335884d02e672ba5f6))
* **proxy:** audit_id on every proxy log line ([397489b](https://github.com/picaportelabs/kubelatch/commit/397489b5fa664ad92bada616d1eb21601555e51e))
* **server:** help for serve and each user subcommand ([003e713](https://github.com/picaportelabs/kubelatch/commit/003e71394674389b13de28c7b6f661ff4c58fcd6))
* **store:** single-use cluster enrollments ([64cb1c6](https://github.com/picaportelabs/kubelatch/commit/64cb1c6ecccc2637a23668270613be6f68991288))
* **web:** register and rotate clusters with the enrollment command ([d7caa90](https://github.com/picaportelabs/kubelatch/commit/d7caa906ec49384d8e830783764ec65942f14641))


### Bug Fixes

* **ci:** log exchange lines with the request context and client_ip ([ca7395a](https://github.com/picaportelabs/kubelatch/commit/ca7395ab4da021330db18dffdd88a6ff9e23de07))
* **cli:** accept -help at top level and a neutral usage hint ([a730413](https://github.com/picaportelabs/kubelatch/commit/a730413c58c36639cc297424d74afa74adbe7591))
* **clusters:** lock the cluster row first in Enroll so it cannot deadlock with Delete ([0acd3c2](https://github.com/picaportelabs/kubelatch/commit/0acd3c223225cfd2647a23481e7d75b6ad5b6179))
* **clusters:** lock the cluster row first when creating an enrollment ([9e184f0](https://github.com/picaportelabs/kubelatch/commit/9e184f0285308fe5abad48634b09dca72be1d13f))
* **clusters:** print the whole server error when it holds escaped quotes ([2825dd1](https://github.com/picaportelabs/kubelatch/commit/2825dd14a0ef7c18566928c96dc3ed0840491102))
* **clusters:** record every enrollment revoke and lock the creator on enroll ([48e39da](https://github.com/picaportelabs/kubelatch/commit/48e39da4eb42eafa626721f0174c49f9f763c568))
* **clusters:** return the enrollment id with the command and the status ([911b3b9](https://github.com/picaportelabs/kubelatch/commit/911b3b91deef8f55b95141abc0d039db1feb417b))
* **clusters:** revoke an enrollment link after 10 attempts that fail validation ([34f5889](https://github.com/picaportelabs/kubelatch/commit/34f58895624c7f18a71801f9a5cc9fb86eefa21e))
* **httpapi:** keep Connection: close on 413 behind the access log ([b231ec9](https://github.com/picaportelabs/kubelatch/commit/b231ec9e44ee8c59da8ed4992e175f290a8cc0fc))
* **httpapi:** log an enrollment script failure with the request id ([3f71b89](https://github.com/picaportelabs/kubelatch/commit/3f71b89820af3ff8a6e9ab88adc9b9bb0324a386))
* **i18n:** point cluster errors at enrollment and token rotation ([2414146](https://github.com/picaportelabs/kubelatch/commit/241414674b0eb6937013cfc4bb1eece758052fc5))
* **web:** treat a newer admin's enrollment as a revoked link in the dialog ([f0b8263](https://github.com/picaportelabs/kubelatch/commit/f0b8263bd17447b6f36ce6299545d1996c9c21e3))

## [0.19.1](https://github.com/picaportelabs/kubelatch/compare/v0.19.0...v0.19.1) (2026-10-02)


### Miscellaneous Chores

* **release:** publish 0.19.1 with the Helm chart description ([7e418a1](https://github.com/picaportelabs/kubelatch/commit/7e418a18fd661a0915342507d812b0af44d20c48))

## [0.19.0](https://github.com/xzehiox/kubelatch/compare/v0.18.0...v0.19.0) (2026-10-02)


### Features

* **credentials:** a ci kind for the GitHub Actions exchange's tokens ([e8e2a19](https://github.com/xzehiox/kubelatch/commit/e8e2a1941f2b232bb8a7dcb2590ae78d14bab314))
* **httpapi:** say on each grant whether its subject is disabled ([5678779](https://github.com/xzehiox/kubelatch/commit/56787799adfc35c64ab1c098cdf4efe64ad07349))


### Bug Fixes

* **auth:** bring GitHub sign-in back to the page that asked for it ([ae52bb8](https://github.com/xzehiox/kubelatch/commit/ae52bb80e1a93abf1868f9975306be8f0f5b0698))
* **cliauth:** looking up and then approving one device code costs one attempt ([571cace](https://github.com/xzehiox/kubelatch/commit/571cace36117a9ff5a6c37f96de9cf7bf4747c56))
* **httpapi:** __Host- prefix on the session and GitHub state cookies over https ([af62453](https://github.com/xzehiox/kubelatch/commit/af6245347bd7faa43de1c8871163fed51f091c99))
* **httpapi:** active=true on grants and credentials lists, subject= on credentials (finding 20) ([89335dd](https://github.com/xzehiox/kubelatch/commit/89335dd34405af6bc581802ca298b13f8f24a342))
* **httpapi:** expire the legacy callback-path GitHub state cookie over http ([c7bd898](https://github.com/xzehiox/kubelatch/commit/c7bd898bad936bb36a4db11868696e2660e448aa))
* **httpapi:** send browser security headers on the SPA and the API ([8daaafa](https://github.com/xzehiox/kubelatch/commit/8daaafa36d32050bd38bd66b8c7587c2e06a8f51))
* **jobs:** membership sync reports a cause code, and a skipped pass keeps the previous status (finding 16) ([2c720d4](https://github.com/xzehiox/kubelatch/commit/2c720d4da5f0060a47d3f953664be40b6ec97bd2))
* **web:** a broken percent escape in the clusters hash no longer crashes the page; keyboard and hash-guard tests ([9b07861](https://github.com/xzehiox/kubelatch/commit/9b07861c5fa867d9aa48248e29e4d6c913bad961))
* **web:** CLI approval pages move focus to the error when Approve goes away ([21e1879](https://github.com/xzehiox/kubelatch/commit/21e1879524570d1928c3cc49616be3082303bc4d))
* **web:** CLI request shows its expiry, Approve goes after an error a retry would repeat, device page takes another code without denying ([db58e75](https://github.com/xzehiox/kubelatch/commit/db58e75cbb7431d72429d35bec24ad4202be4443))
* **web:** cluster, resource and source IP in mono in the audit and credentials tables (finding 23) ([99d3d7b](https://github.com/xzehiox/kubelatch/commit/99d3d7be177711a485939505f052cb7de1bf1a02))
* **web:** clusters mark and disable only the card that is working, and keep the delete result across page changes (finding 18) ([a61a079](https://github.com/xzehiox/kubelatch/commit/a61a07924529268603b8c2daa80802e59d4aadd1))
* **web:** command palette entries say where they lead and offer My account, shortcut label and Ctrl+K follow the platform, notices bell refreshes, shows loading, closes on a link and warns of clusters in error, segment and filter live in the URL ([47e0e91](https://github.com/xzehiox/kubelatch/commit/47e0e918e8633baecd326c186cfa2ab948f341d0))
* **web:** control log labels a used link by its purpose, names reset links by both uses, translates target kinds, discovery and actor-less rows; login points newcomers to the invitation link and break-glass to the server CLI (finding 22) ([feb6acf](https://github.com/xzehiox/kubelatch/commit/feb6acf52b3c9f96b8a2eb21378ac6a0d90b36c5))
* **web:** countdown text agrees with its colour, dates say the year and audit rows seconds and zone, durations use hours, lock text expires on its own ([bf80c4c](https://github.com/xzehiox/kubelatch/commit/bf80c4c4b61bd1aac7c3bf66b41833134a57ff96))
* **web:** credential dialog leaves its spacing to the Modal gap, no blank over Close (finding 23) ([4f6e9a2](https://github.com/xzehiox/kubelatch/commit/4f6e9a2802ac6b03b87df8d2cceec6f292c26bad))
* **web:** derive a credential's active state from expiry, not the stale snapshot ([5245c88](https://github.com/xzehiox/kubelatch/commit/5245c881a5caab6cfbe3a5a7d2e261526a0ad696))
* **web:** derive active/expired from expires_at instead of a stale snapshot ([c20ba00](https://github.com/xzehiox/kubelatch/commit/c20ba0051028caabb13e51e60375cead2e068694))
* **web:** DESIGN.md norm matches the code: radii, control borders, status colours, backdrop token ([d826296](https://github.com/xzehiox/kubelatch/commit/d826296d9c281acfaf3834a8d6b12fb4bdc8195c))
* **web:** expired session says so on login, bootstrap failure offers retry and names 5xx, ingress HTML errors read as server errors, theme and lang set before paint, GitHub result params leave the URL, loading and error tabs get their own titles ([8825067](https://github.com/xzehiox/kubelatch/commit/88250672a112cba10d972069ddf276f188f20a11))
* **web:** focus rings come from the shared :focus-visible style, not hand-made ring classes (finding 23) ([ef3c43b](https://github.com/xzehiox/kubelatch/commit/ef3c43bdc4f806a3c13cae4385225815f31bd653))
* **web:** forms say why they block: cluster id pattern valid under the v flag with a hint, CI rule id and ref messages on the server's rules, PSA in grantProblem, grant warnings in the live summary, expiry reset announced (finding 19) ([60f7da8](https://github.com/xzehiox/kubelatch/commit/60f7da8cf774f746c25e1df243b67effa4804240))
* **web:** forms validate email in the page language, repeat password waits until touched, bootstrap JSON must hold server and tokens and clears its error on edit, paging keeps unapplied audit filters, sheet bodies scroll, account page has a hidden username ([423dba7](https://github.com/xzehiox/kubelatch/commit/423dba78cbd6ffd44c1afedb33064e11780a5ddf))
* **web:** grant detail in the right detail sheet like Audit, focus back to the row button; its cluster and namespace in mono (finding 23) ([4a40088](https://github.com/xzehiox/kubelatch/commit/4a400885e7b76c46a1e91204c5cbea7a01503505))
* **web:** guard late sheet responses by generation, block close while pending ([66c9b6c](https://github.com/xzehiox/kubelatch/commit/66c9b6c76389f1913c2e588e430008f88469072f))
* **web:** guard prototype-key lookups and add error boundaries ([6c26275](https://github.com/xzehiox/kubelatch/commit/6c262756cac60e417811f6321f5b5c372b29ebea))
* **web:** identity switch drops the mutation cache, sync cause lookup uses Object.hasOwn, pinned audit pages say their end and Search leaves them, Active tab counts disabled accounts' grants ([e527960](https://github.com/xzehiox/kubelatch/commit/e527960be43a9d1923332783f68504dad40b799c))
* **web:** issue-credential durations follow the server maximum, plural-aware, neutral wording (finding 15) ([87bd8bd](https://github.com/xzehiox/kubelatch/commit/87bd8bddf55e2657666ca066668eb312cfa9b0d7))
* **web:** keep a reloaded account-link page honest, stop caching secrets ([2cebfe5](https://github.com/xzehiox/kubelatch/commit/2cebfe57886b54af0f8905cdbf09672a6ab24e5e))
* **web:** keep cached lists when a refetch fails, and say when the permission form or GitHub card can't load (R47) ([1d87f8c](https://github.com/xzehiox/kubelatch/commit/1d87f8c9d3a50ea4dcbdb193af53a248708f2a64))
* **web:** keep focus off &lt;body&gt; when a row, page or dialog disappears ([e7be700](https://github.com/xzehiox/kubelatch/commit/e7be700c536bace99d81889da277f05de7c929b5))
* **web:** keep pasted klt_ tokens out of the URL filter ([65a98b5](https://github.com/xzehiox/kubelatch/commit/65a98b56dfee8e04cc47e81a11696b497a2b5497))
* **web:** keep the session alive locally when Sign out fails ([0a2faa8](https://github.com/xzehiox/kubelatch/commit/0a2faa8345583f08f81b0747dc8c36b0c861f9cc))
* **web:** list filters find the words the rows show: whole cluster instead of *, all clusters, any ref or environment, the CLI line (finding 24) ([45f44c1](https://github.com/xzehiox/kubelatch/commit/45f44c1c8adce136c5ffc14e7cf747a68742f722))
* **web:** one danger ink (text-danger-ink) for field problems, inputs select in ink, password submit aligned to the start (finding 23) ([c7241d0](https://github.com/xzehiox/kubelatch/commit/c7241d05af3d9562289e1ae2edb94ac426815d3a))
* **web:** one word per concept across screens: Account for the subject, Login, Member, Person, la CLI, break-glass, creations named alike in header, sheet and palette; Home has one name; palette groups say they open the audit log; one revoke style (finding 24) ([bd4664c](https://github.com/xzehiox/kubelatch/commit/bd4664c4f1eef42057c1160e8edfbf388a0d7aa8))
* **web:** refresh caches after revokes, disables and cluster deletes, and a credential.not_found code (finding 13) ([874fce0](https://github.com/xzehiox/kubelatch/commit/874fce04b0be6d916d7244f5c4ecde9d1f05cb46))
* **web:** reset error boundaries on route change, test the root boundary itself ([81e5129](https://github.com/xzehiox/kubelatch/commit/81e512982cba1ac847cffce8bc32d222f45f656e))
* **web:** route changes move focus to the page heading and announce it, a pending or last-page button keeps its focus, copy and loading are announced, info once only in a title is text, tables and group lists have names, empty cells read as no value, error screen has an h1, modal drops its repeated description, current crumb is not a disabled link ([1c4337e](https://github.com/xzehiox/kubelatch/commit/1c4337e80701f62db96fc1a4737e78f5377d4b65))
* **web:** sidebar marks that add up, and the audit's product decisions D1-D6 ([9978661](https://github.com/xzehiox/kubelatch/commit/99786610116afb3dcf2cc12640a5c97297d15d9f))
* **web:** sidebar marks, command palette and Home ask only for active rows; Home lists only my credentials (finding 20) ([d351d65](https://github.com/xzehiox/kubelatch/commit/d351d65b2571635462d12866c18e98db005c250f))
* **web:** stop a failed assertion from leaking fake timers across HomePage tests ([c9ebf24](https://github.com/xzehiox/kubelatch/commit/c9ebf2481704162c5b3d60a67bf4e51bfd8123b5))
* **web:** tab panel focus and trigger contrast, valid palette listbox, search button name, exact expiry in grant detail, announced empty state, phone sheet close (finding 21) ([656205f](https://github.com/xzehiox/kubelatch/commit/656205fd7ae3946fc268e0f895543c51b180dd9f))
* **web:** texts, plural and wording fixes, API errors read as sentences and unknown codes are localised, one term per concept in the interface and the Spanish manual ([ff7dec9](https://github.com/xzehiox/kubelatch/commit/ff7dec9d5fbcbb254ff94f077b9fafd818cbcf14))
* **web:** the audit table draws a person's initials from their name, like every other list (finding 24) ([9404976](https://github.com/xzehiox/kubelatch/commit/9404976f28cda505106df1189c21121cc94f4839))
* **web:** theme-color is paper and follows the chosen theme ([e5ca90a](https://github.com/xzehiox/kubelatch/commit/e5ca90a2aaa9a79a6bbf810fb6480fa19e05c4d8))
* **web:** validate audit deep-link params, pin the window while paging, summary on the control tab, From before To, past-the-end text (finding 17) ([fa74160](https://github.com/xzehiox/kubelatch/commit/fa74160bb02889448de75d6893ff963647496a8e))
* **web:** wrap long table cells instead of overflowing horizontally ([583a122](https://github.com/xzehiox/kubelatch/commit/583a122e9990ebdebd57e059d03439950febbde5))

## [0.18.0](https://github.com/xzehiox/kubelatch/compare/v0.17.0...v0.18.0) (2026-10-01)


### Features

* **web:** an expiry under 24 h is red, with its own count in the sidebar ([6bb3f7e](https://github.com/xzehiox/kubelatch/commit/6bb3f7e4d79d985b21521b1412112e494e55e86a))

## [0.17.0](https://github.com/xzehiox/kubelatch/compare/v0.16.0...v0.17.0) (2026-09-30)


### Features

* **web:** «expires soon» is 7 days or less left, for everything ([d69e5a6](https://github.com/xzehiox/kubelatch/commit/d69e5a6fc4b6a40665e7f336eeb1883c9e774fbc))
* **web:** a grant of a day or less expires soon in its last quarter too ([c4aa07c](https://github.com/xzehiox/kubelatch/commit/c4aa07c56a3024995ced0c6b0046aa3d8746ee63))

## [0.16.0](https://github.com/xzehiox/kubelatch/compare/v0.15.0...v0.16.0) (2026-09-30)


### Features

* **web:** one «expires soon» rule for the expiry pill, the figures and the sidebar mark ([af34ab0](https://github.com/xzehiox/kubelatch/commit/af34ab0ec2c61d76103e70116ea4447260668870))
* **web:** Permissions gets the sidebar mark; a CLI session's expiry warns in its last quarter ([0041730](https://github.com/xzehiox/kubelatch/commit/00417302cefce4c3b149b35672acfe977fa5e8ce))

## [0.15.0](https://github.com/xzehiox/kubelatch/compare/v0.14.0...v0.15.0) (2026-09-30)


### Features

* **web:** a tooltip says what the sidebar's Credentials mark counts ([6faf530](https://github.com/xzehiox/kubelatch/commit/6faf5308a1d09f7f9a07f1b2534809fa51e45e4f))
* **web:** an access card says «namespace» before the namespace it covers ([97098fe](https://github.com/xzehiox/kubelatch/commit/97098fe60fcd3552237932a2f2242e47e10fa6b7))

## [0.14.0](https://github.com/xzehiox/kubelatch/compare/v0.13.0...v0.14.0) (2026-09-30)


### Features

* **web:** the sidebar marks only credentials that expire within a week, on every page ([2c870ad](https://github.com/xzehiox/kubelatch/commit/2c870ad6b0098eab4427693ca74273fff4c671ac))


### Bug Fixes

* **web:** a revocation's reason on a line of its own, so the credentials table keeps its width ([b7344ea](https://github.com/xzehiox/kubelatch/commit/b7344ea37c1c9093c60a4102089505c7a06baeb1))

## [0.13.0](https://github.com/xzehiox/kubelatch/compare/v0.12.0...v0.13.0) (2026-09-30)


### Features

* **landing:** share images with the agents line, and a link to the AI agents guide ([85e7d8e](https://github.com/xzehiox/kubelatch/commit/85e7d8ef4b339142da3f9300aa431f08dfbc6db0))
* **web:** «Not you? Sign out» on the CLI sign-in pages, back to the request after signing in ([991f7c8](https://github.com/xzehiox/kubelatch/commit/991f7c8258a2fbf45096665c4a557499130275f5))
* **web:** a CI rule's creation date in view under its name ([d8e0f81](https://github.com/xzehiox/kubelatch/commit/d8e0f81872ef569311d42cf6934dbb723031bbc1))


### Bug Fixes

* **web:** «Entorno» for a trust rule's environment in Spanish, in the UI and the manual ([4f83b45](https://github.com/xzehiox/kubelatch/commit/4f83b45cc807207e97ff11a54cf75e2066bf1668))
* **web:** a failed background check of the session keeps the page ([05c4f0e](https://github.com/xzehiox/kubelatch/commit/05c4f0eb52f8878aef7d36e4dd7073e48b5c519b))

## [0.12.0](https://github.com/xzehiox/kubelatch/compare/v0.11.0...v0.12.0) (2026-09-30)


### Features

* **landing:** fixed mixed scheme, AI agents section and a new cover video ([ed833be](https://github.com/xzehiox/kubelatch/commit/ed833bec5f113e2b025f703a8a68c8e3fd0605ed))

## [0.11.0](https://github.com/xzehiox/kubelatch/compare/v0.10.0...v0.11.0) (2026-09-29)


### Features

* **landing:** cover video with the new shell in scenes 4 and 5, in Inter ([45c81be](https://github.com/xzehiox/kubelatch/commit/45c81be36b8dbe347fb7efdf4eb77debe7c07de6))
* **landing:** Inter self-hosted and the radii, shadows and paper of the new system ([a7d57e5](https://github.com/xzehiox/kubelatch/commit/a7d57e577d18b346c7bd0a17e43300ce6244dc53))
* **web:** add the sessionless shell (R65) ([4b75e3d](https://github.com/xzehiox/kubelatch/commit/4b75e3deb943883e57e09a7795f8da319b8dc4c7))
* **web:** draw the session check's network error in the shell (R71) ([1d1a449](https://github.com/xzehiox/kubelatch/commit/1d1a449f8eea1db769e3ad94e9570c351f491070))
* **web:** move Login to the sessionless shell (R66, R68 to R70) ([ce454a5](https://github.com/xzehiox/kubelatch/commit/ce454a5228e9aab2de57d1a0dc90849d4b53b82b))
* **web:** move the account link to the sessionless shell (R65, R68 to R70) ([5d0792b](https://github.com/xzehiox/kubelatch/commit/5d0792b14d1eec68f53e9b5d7dfec70697329154))
* **web:** move the CLI pages to the sessionless shell, outside the layout (R67 to R70) ([0c2b0e0](https://github.com/xzehiox/kubelatch/commit/0c2b0e055d91df9c658e1b392184c517c0229768))
* **web:** name the account in the CLI request and draw it with the generated Alert (R67, R68) ([0f75ff1](https://github.com/xzehiox/kubelatch/commit/0f75ff11c94db1023fd45520df4521afdd74af1e))


### Bug Fixes

* **web:** drop the breadcrumb entries of the CLI pages, which left the layout ([b086d76](https://github.com/xzehiox/kubelatch/commit/b086d760dfa4629d7d569adacf9f6b6166af9772))
* **web:** keep a language chosen before the session is known out of the account (R73) ([c4b75d4](https://github.com/xzehiox/kubelatch/commit/c4b75d44f5a9d3e033e015ba10bd648c05c80d3a))
* **web:** keep the account link's language choice in the browser, out of the open session's account (R73) ([684b0f6](https://github.com/xzehiox/kubelatch/commit/684b0f6602e03a749a8ad7444cf0c1831d80c16d))
* **web:** say «caducidad» in the two grant expiry errors and read the account cell without a class (R79) ([9c5777b](https://github.com/xzehiox/kubelatch/commit/9c5777bc35e6645b321d7ad2f1ffe527e7a68991))


### Reverts

* **landing:** bring back the previous cover video, simplified and dark ([422e87b](https://github.com/xzehiox/kubelatch/commit/422e87b7f85105515ba7ffb6415b7b11fa6a17a9))

## [0.10.0](https://github.com/xzehiox/kubelatch/compare/v0.9.0...v0.10.0) (2026-09-29)


### Features

* **web:** add the audit Filters popover with its applied count and the period field ([707c139](https://github.com/xzehiox/kubelatch/commit/707c13967acea15c5ae7629167d7eeba5efbcb4f))
* **web:** draw the audit table with the generated Table and a status pill ([7c50ee8](https://github.com/xzehiox/kubelatch/commit/7c50ee894a46135100ba8c7a2601c245b9f65198))
* **web:** move the Audit page to the header, generated tabs, a Filters popover and cards ([6ab7422](https://github.com/xzehiox/kubelatch/commit/6ab7422dedf4dd6a40787c4968152bf641be3970))
* **web:** move the Pager to outline buttons with chevrons ([d3b0a04](https://github.com/xzehiox/kubelatch/commit/d3b0a04e81e454d6e208655772f59843707c87d5))
* **web:** show the audit detail in a right sheet with its actions in the footer ([a9adcd7](https://github.com/xzehiox/kubelatch/commit/a9adcd752acae4c0224d37c28e7a03b118cb9b0e))


### Bug Fixes

* **web:** keep cached credentials and activity on Home when a refetch fails ([02f6654](https://github.com/xzehiox/kubelatch/commit/02f6654d4f367060aff32d78b39602e1e255cca5))
* **web:** put a space between a bot subject's login and the word "bot" ([7cf8ee5](https://github.com/xzehiox/kubelatch/commit/7cf8ee5e962480ffd931607d9a9920deeace23e3))
* **web:** report a failed explicit search on the Audit page (R63) ([d7c9088](https://github.com/xzehiox/kubelatch/commit/d7c9088b049fb33a1fc14916c2bda223e8e5f5b7))

## [0.9.0](https://github.com/xzehiox/kubelatch/compare/v0.8.0...v0.9.0) (2026-09-29)


### Features

* **web:** add account segments and figures for the Users page ([459afe6](https://github.com/xzehiox/kubelatch/commit/459afe6187a010a66271581a583ee594ce780c08))
* **web:** add credentialStats for the Credentials figures ([aa7c979](https://github.com/xzehiox/kubelatch/commit/aa7c9791447c1ae5f7369072402c8ae2977c52ff))
* **web:** add IssueCredentialSheet, which alone holds the issued secret, and use it on Home ([cdcbf89](https://github.com/xzehiox/kubelatch/commit/cdcbf8969dca54f177c774490f6e15e2e93e7c33))
* **web:** add StatCards, PersonCell and RowMenu for the list pages ([483b5cd](https://github.com/xzehiox/kubelatch/commit/483b5cd2eb7c6c2f83bacf13a26f3eee4a520172))
* **web:** add the account creation form for the Users sheet ([a6f3b6e](https://github.com/xzehiox/kubelatch/commit/a6f3b6e920899cda7aa5f914c65144152228cd0b))
* **web:** add the bootstrap dialog as a component on the generated primitives ([df0ec6e](https://github.com/xzehiox/kubelatch/commit/df0ec6e47eaf7be17be508fa68c8ca106561b2e4))
* **web:** add the cluster card with its status, facts, actions and namespaces ([3dd71bb](https://github.com/xzehiox/kubelatch/commit/3dd71bb8630ef7cc9d5067b21fdb7df22ff1e4c9))
* **web:** add the trust rule form on the generated primitives, keeping input until the server says yes ([52f561a](https://github.com/xzehiox/kubelatch/commit/52f561af8f88e0b6f846290e6f6b9ed6be7e0525))
* **web:** draw bots with a bot icon and head mixed rows with Account ([ac7c3e5](https://github.com/xzehiox/kubelatch/commit/ac7c3e5490ce3ed1a59e3e2a83499675e3b997ad))
* **web:** let Modal and CredentialDialog return focus to a given element, move the dialog to tokens ([ae3b2f4](https://github.com/xzehiox/kubelatch/commit/ae3b2f413eff799c4ba60328442ed01e56e9a5d7))
* **web:** list a failed GitHub membership sync among the notices ([860ab45](https://github.com/xzehiox/kubelatch/commit/860ab45c72920c18d47a8c3bfc39ad41d94b07be))
* **web:** migrate Credentials to the page pattern: sheet, figures, segments and row menu ([4897010](https://github.com/xzehiox/kubelatch/commit/4897010685cd5baf0dbe2f3a9d3992411c7efc66))
* **web:** migrate Permissions to the page pattern: sheet, figures, segments and row menu ([ce2f5cc](https://github.com/xzehiox/kubelatch/commit/ce2f5cc67d5f4ca3ba1665a796e6b3a9ad2852e9))
* **web:** move CI to the list page pattern with figures, a row menu and a creation sheet ([ed7694e](https://github.com/xzehiox/kubelatch/commit/ed7694e4d6048d25785215e959c3222dfe4b4af4))
* **web:** move Clusters to the page pattern with cards and a registration sheet ([6279e88](https://github.com/xzehiox/kubelatch/commit/6279e8804428e0685728462ef4716ea88c809354))
* **web:** move CredentialsTable to the generated Table with an owner cell and a row menu on admin pages ([82774b0](https://github.com/xzehiox/kubelatch/commit/82774b063ec35cc8e289837c481f479f3386c0ad))
* **web:** move Users to the list page pattern ([a43b2c0](https://github.com/xzehiox/kubelatch/commit/a43b2c046dc340b54d246204d6174c2c425cad04))
* **web:** run a row menu command once focus is back on its button ([f20672a](https://github.com/xzehiox/kubelatch/commit/f20672aef33765bfb6f0e99a504d1e89c4933883))


### Bug Fixes

* **web:** do not raise the 2FA-unknown notice when the last sync failed ([3de9898](https://github.com/xzehiox/kubelatch/commit/3de98985ff276cb7050efe17c8e3c6ae4bac7205))
* **web:** drop the leading by/por from the Granted by cell (R37) ([733a7c0](https://github.com/xzehiox/kubelatch/commit/733a7c0c4bbfaa933b95306c28ab4fba1b419a21))
* **web:** drop the tinted destructive ring so a focused invalid field keeps its cobalt focus ring (R36) ([6fbcb35](https://github.com/xzehiox/kubelatch/commit/6fbcb3564449cc6c92bbdf9111879004b99126f7))
* **web:** give focus back to the row menu after pasting tokens again on a registered cluster ([6761914](https://github.com/xzehiox/kubelatch/commit/67619147a5e32ccab6d8fd5dfa2698c43162936f))
* **web:** keep a reopened CI sheet open on a late success, focus the header after a delete, filter by repository ids ([a8ac4d1](https://github.com/xzehiox/kubelatch/commit/a8ac4d12aced091f0718a1323e8be35d972db56a))
* **web:** keep a reopened Users sheet open when an earlier creation succeeds late ([e504ffc](https://github.com/xzehiox/kubelatch/commit/e504ffc4c73393fdb1ffe73678ca7f2060098ac1))
* **web:** keep an empty Notice out of the page grid so it adds no double gap ([0314070](https://github.com/xzehiox/kubelatch/commit/03140703c7a55288961840dbedf3f2b1d45db46e))
* **web:** keep ring-destructive only on the generated controls that draw a ring (R34) ([b23905f](https://github.com/xzehiox/kubelatch/commit/b23905faf760f1efbfdfbbac1454a3e63ca35acb))
* **web:** keep the subject picker when a subjects refetch fails ([67cffc2](https://github.com/xzehiox/kubelatch/commit/67cffc2c984b246bbbc6a6f8e0cadd1957e0dd9a))
* **web:** move shared query keys and subjectLabel into lib ([acd678b](https://github.com/xzehiox/kubelatch/commit/acd678bf8f5b000c9c819dc8e80a9be3fb492369))
* **web:** name the owner in the admin credential row menu and Requests link ([d41baa9](https://github.com/xzehiox/kubelatch/commit/d41baa97b04867dcf500868365e6754d039bdcb9))
* **web:** reset pasted tokens on close, anchor the palette's cluster links, keep focus on the Clusters page ([75d88db](https://github.com/xzehiox/kubelatch/commit/75d88db9ee60222bbda321ee9d5bb77cdf9cd585))
* **web:** say a reconciled cluster's status is on its card, not in a table ([10627cd](https://github.com/xzehiox/kubelatch/commit/10627cdc2cd9e85818635b7ac2a25e3febc702b1))
* **web:** say caducidad, not expiración, across the Spanish grants texts ([8039012](https://github.com/xzehiox/kubelatch/commit/80390124bd76e8806b833f9fdcfc89dbad6fd09a))
* **web:** show the subjects loading and failure inside the admin issue sheet ([7343405](https://github.com/xzehiox/kubelatch/commit/7343405e480f620198a61f972e73185d46d145ca))

## [0.8.0](https://github.com/xzehiox/kubelatch/compare/v0.7.0...v0.8.0) (2026-09-29)


### Features

* **web:** configuration notices in the top bar ([04a7268](https://github.com/xzehiox/kubelatch/commit/04a72689fc139b258450be04f07f67a6bec02abf))
* **web:** Home on the new system — connect card, access cards, credentials and activity ([1f27b87](https://github.com/xzehiox/kubelatch/commit/1f27b8788b5fab41ead3d03b46d5538955d80210))
* **web:** Modal and ConfirmDialog on the shadcn dialogs, same API ([84352c1](https://github.com/xzehiox/kubelatch/commit/84352c1ea21d5baf3af89e3fd926562b5f4c3253))
* **web:** My account as four cards on the new system ([11e81a9](https://github.com/xzehiox/kubelatch/commit/11e81a9163e2bcd507ccc6181f7cc8b34b3c46be))
* **web:** pick light, dark or the system's scheme, and the language, in My account ([53745b9](https://github.com/xzehiox/kubelatch/commit/53745b913f19033cb6661a7928fd1ee55467ccba))
* **web:** shadcn/ui primitives, generated and themed ([46632f6](https://github.com/xzehiox/kubelatch/commit/46632f6ecf55d6ee384de756af3a423f902d8443))
* **web:** the command palette — pages, actions, people, clusters and credentials ([6eb77c5](https://github.com/xzehiox/kubelatch/commit/6eb77c55b2a2e46f76860ed1a233b83531807c9e))
* **web:** the sidebar shell — grouped navigation, top bar, person menu ([0c58ea5](https://github.com/xzehiox/kubelatch/commit/0c58ea58efd0fa24f3717ecde1f716f43a3ccfb3))
* **web:** the warm palette, mapped onto shadcn's tokens, with Inter ([96d89b9](https://github.com/xzehiox/kubelatch/commit/96d89b9f47ac7eb9d14fc185554185b604c53261))


### Bug Fixes

* **web:** a focus ring that shows on brand-filled controls, and the leftovers of the old ring ([fa3e61b](https://github.com/xzehiox/kubelatch/commit/fa3e61b03430a8a187dbb9c992a1972481721ab5))
* **web:** an error boundary around admin routes for a stale lazy chunk (F2) ([158530f](https://github.com/xzehiox/kubelatch/commit/158530fe7e9e9b4991c88835e14fc55b6c4d4d50))
* **web:** command dialog heading, sidebar toggle state, no Ctrl+B, member search hint (F3, F4, F5, F9, F10) ([caa32ee](https://github.com/xzehiox/kubelatch/commit/caa32eecaed9e074c120950e5c63ab0d7c29c427))
* **web:** command palette respects an open modal, reissued credentials get fresh dialog state (F1) ([a5ee950](https://github.com/xzehiox/kubelatch/commit/a5ee9504f58ec2f12f5c58cb44e6d3a990b83ebe))
* **web:** drop aria-busy from SectionSkeleton's status region (F12) ([76f31a9](https://github.com/xzehiox/kubelatch/commit/76f31a9ae3e15bc3d505d65ed730a062708047d0))
* **web:** loading skeletons announce themselves; an issue error survives a closed sheet ([f8f8cd4](https://github.com/xzehiox/kubelatch/commit/f8f8cd4a3ee7f74773db7607fb3936b795967522))
* **web:** muted and destructive foregrounds clear 4.5:1 in both schemes ([2a3af51](https://github.com/xzehiox/kubelatch/commit/2a3af513b4f5e825b4064e566a2214e7fc121f4e))
* **web:** the admin error boundary blames an update only for a failed import ([51ddace](https://github.com/xzehiox/kubelatch/commit/51ddacea71793a4bb406010752a7b5cb88b1e8a6))
* **web:** the breadcrumb landmark is named from the dictionaries ([0d2ae50](https://github.com/xzehiox/kubelatch/commit/0d2ae504e5d36f9808121f425f616ab2a27cd049))
* **web:** the collapsed brand link keeps its name; hover and active differ in the sidebar ([ab445b3](https://github.com/xzehiox/kubelatch/commit/ab445b38da385df83decdcaed7961280f7f2ef16))
* **web:** the generated primitives meet the spec — radii, shadows, surfaces, borders, focus and reduced motion ([0e8b8d3](https://github.com/xzehiox/kubelatch/commit/0e8b8d320e5dc90e23e63e8b9c1c02aabc67dd5f))
* **web:** the GitHub card holds its notice, so the account columns line up ([3c770d6](https://github.com/xzehiox/kubelatch/commit/3c770d6af00a48b9dc4ffddde56ffa67352ed31c))
* **web:** the notices popover is named, and the unknown-2FA notice reads as a sentence ([8b87345](https://github.com/xzehiox/kubelatch/commit/8b873459bb5826f7c58c719ff2ad37ffacf4fc7d))
* **web:** use outline-solid for the focus-visible outline style, extend the brand guard (F7, F8) ([af7ab9d](https://github.com/xzehiox/kubelatch/commit/af7ab9dc3d6655b9106c7695c3cb932cf2687c55))


### Performance Improvements

* **web:** admin pages load on demand, with a page skeleton ([ea53ceb](https://github.com/xzehiox/kubelatch/commit/ea53ceb0303640ae7d685c5c3fe3cd964f3e1f1b))

## [0.7.0](https://github.com/xzehiox/kubelatch/compare/v0.6.0...v0.7.0) (2026-09-28)


### Features

* **web:** a dark scheme that follows the system, as one token remap ([5bbe7c3](https://github.com/xzehiox/kubelatch/commit/5bbe7c3370f06ef7031a77420cda20f4917da97c))
* **web:** grant rows link to their requests, and a tier that rewrites the scope says so ([7db27be](https://github.com/xzehiox/kubelatch/commit/7db27be4c00b3d0450d10298017b734cd0ee6134))

## [0.6.0](https://github.com/xzehiox/kubelatch/compare/v0.5.0...v0.6.0) (2026-09-28)


### Features

* **landing:** the video carries the cobalt accent on the key, the sign-in button and the revoke ([f076c12](https://github.com/xzehiox/kubelatch/commit/f076c1209f047ade325069a6bd8928f4a7da1c8e))

## [0.5.0](https://github.com/xzehiox/kubelatch/compare/v0.4.0...v0.5.0) (2026-09-28)


### Features

* Blueprint Blue, one accent for action and position across the SPA, the logo and the manual ([ed86d2e](https://github.com/xzehiox/kubelatch/commit/ed86d2e282a716d2fb3d42eee20f9b356630922b))
* **landing,docs:** the cobalt accent on the CTA, focus and the mark; a dark-scheme logo for the manual ([c310a1d](https://github.com/xzehiox/kubelatch/commit/c310a1da8a3d856b0a1da7e24e1c8170f9aa1c34))
* the accent is cobalt, deep enough to sit beside the ink ([89feb56](https://github.com/xzehiox/kubelatch/commit/89feb5640b01334549fc1fb4c1ec90b37535821a))

## [0.4.0](https://github.com/xzehiox/kubelatch/compare/v0.3.0...v0.4.0) (2026-09-28)


### Features

* **web:** autofilled fields keep the product's white and ink ([65e6479](https://github.com/xzehiox/kubelatch/commit/65e6479e2b1edbf2be27d098bcae7e4447094f7b))
* **web:** typeset the titles, tabular figures, themed browser surfaces and one arrival motion ([bfccc28](https://github.com/xzehiox/kubelatch/commit/bfccc280b3ec5a6f7c8c61c8fcfc1c462c4b9128))

## [0.3.0](https://github.com/xzehiox/kubelatch/compare/v0.2.1...v0.3.0) (2026-09-28)


### Features

* **audit:** filter requests by credential prefix, rejected tokens included ([a81f569](https://github.com/xzehiox/kubelatch/commit/a81f5698becd12bae572cd33254bfc8eab620e56))
* **audit:** filter the control-plane log by actor, action and period ([fb633f5](https://github.com/xzehiox/kubelatch/commit/fb633f519def215e8f3cc11189026435299808c2))
* **httpapi:** /api/tiers carries the credential TTL maximums ([8d604c2](https://github.com/xzehiox/kubelatch/commit/8d604c2e753b46f68901cc109067332c80af1e1e))
* **httpapi:** grants say who granted them ([87e2b31](https://github.com/xzehiox/kubelatch/commit/87e2b31ed6250fd0da46a4ba8cf898079c612f56))
* routes in English; the Spanish ones redirect ([2f813c1](https://github.com/xzehiox/kubelatch/commit/2f813c1b9082667eec38a0ab0034f1ba7ca35fd1))
* **web:** a GitHub org without 2FA is a configuration warning on Users ([2181cf1](https://github.com/xzehiox/kubelatch/commit/2181cf198dc1013baf7ddc18fa8567cf94cf04f4))
* **web:** account actions confirm in the app, making an administrator too ([d3ba612](https://github.com/xzehiox/kubelatch/commit/d3ba612260ebaecb4623999ec71542d5a91b2679))
* **web:** ConfirmDialog, the app's own confirmation ([7334b02](https://github.com/xzehiox/kubelatch/commit/7334b026708d39af8fcab79ff75761c4f12d2b0d))
* **web:** CopyField reports and resets its copy; Modal can refuse a close ([50d5a74](https://github.com/xzehiox/kubelatch/commit/50d5a74339ffdc90f488276bae8e8a6833a19b53))
* **web:** empty lists tell filtered from empty, and help sits where decisions are made ([232ff6f](https://github.com/xzehiox/kubelatch/commit/232ff6fcb79f67f5d8ea890c0ad7e5f6c7fa980e))
* **web:** enable confirms, records link into the audit log, pivots keep focus and feedback in view ([dd6031c](https://github.com/xzehiox/kubelatch/commit/dd6031caf71473d41edde0f03926d3e1c893d992))
* **web:** expiry choices for a grant, with 30 days by default ([e82fc99](https://github.com/xzehiox/kubelatch/commit/e82fc99b13a92f586791d10b7c70321614847df7))
* **web:** grant in three steps with the summary of what is granted ([c856352](https://github.com/xzehiox/kubelatch/commit/c856352617cc346d43cd1388ac0f1dae9c6766f6))
* **web:** Home leads with kubelatch login; the kubeconfig by hand is the alternative ([cdcb6ba](https://github.com/xzehiox/kubelatch/commit/cdcb6bae5c5c8a97f54b433e14b021b9f6172118))
* **web:** one way to write an expiry, and weight for elevated tiers ([ebfdb66](https://github.com/xzehiox/kubelatch/commit/ebfdb667a475a93cd16927b25377e48d425a3ade))
* **web:** revokes and deletes confirm in the app, not the browser ([da94af1](https://github.com/xzehiox/kubelatch/commit/da94af1cbb63ba2a7d7a61999c9c8aabdc5bded3))
* **web:** tables lead with expiry, elevated tiers and who granted ([865325e](https://github.com/xzehiox/kubelatch/commit/865325ebec2755cfc5539541a5b93dde7d0091e4))
* **web:** the audit log keeps its filters in the URL and acts from a request ([5c8fa96](https://github.com/xzehiox/kubelatch/commit/5c8fa968cb424b61ebe849a57f95b511a66ead6b))
* **web:** the control-plane log says what happened and lets you filter it ([a944925](https://github.com/xzehiox/kubelatch/commit/a94492554c05c36d848c86f4fa4b706c988620ec))
* **web:** the credential dialog leads with the kubeconfig and guards its close ([86dcefb](https://github.com/xzehiox/kubelatch/commit/86dcefb194a6b1c6e49585cc748313ca74d83d39))
* **web:** the header follows daily use and starts with a skip link ([adf3ea2](https://github.com/xzehiox/kubelatch/commit/adf3ea2b81a599ce7458c69f18fd70f82fd0511b))
* **web:** the issue form offers only durations the subject may get ([b48b4f1](https://github.com/xzehiox/kubelatch/commit/b48b4f1572a969926b5e3b0fc6a13a7e0d1e66f2))


### Bug Fixes

* **audit:** milestone 5 review findings ([2bcdb9b](https://github.com/xzehiox/kubelatch/commit/2bcdb9b057d9063df5fd761c4d3a786332a11cd4))
* **audit:** single-word actions such as logout can be filtered ([d4bc7af](https://github.com/xzehiox/kubelatch/commit/d4bc7af1cb583bde02908aa9d8b2e55c500d8ecc))
* milestone 4 review findings ([cd4c75d](https://github.com/xzehiox/kubelatch/commit/cd4c75d4e19439948403da191b9b83f730572495))
* **web:** audit filters in the sentence, pivots that keep rejected tokens, visible revoke feedback ([6fcc668](https://github.com/xzehiox/kubelatch/commit/6fcc66826bfb8d2279080f20af8c64c0ffc159bd))
* **web:** milestone 1 review findings ([20760c2](https://github.com/xzehiox/kubelatch/commit/20760c25502918c845f7ddc6740d83f7163184f9))
* **web:** milestone 2 review findings ([c839d15](https://github.com/xzehiox/kubelatch/commit/c839d15fb4b08940d51e4b03414417a207947f01))
* **web:** milestone 3 review findings ([e9a179e](https://github.com/xzehiox/kubelatch/commit/e9a179e83b3381711e1a559bb3b49ced8a08c0f0))
* **web:** milestone 6 review findings ([6924973](https://github.com/xzehiox/kubelatch/commit/69249731b767fa5c378d3b04eee9c2c74794e3e2))
* **web:** the admin warning waits for a namespace ([17fb527](https://github.com/xzehiox/kubelatch/commit/17fb527a99940a9601b06a88e0e137599524b8e5))
* **web:** the try-it command works for namespace-scoped grants ([c80d4a3](https://github.com/xzehiox/kubelatch/commit/c80d4a3da0ad0af6f151c16b227a5f97f50df8a3))

## [0.2.1](https://github.com/xzehiox/kubelatch/compare/v0.2.0...v0.2.1) (2026-09-27)


### Bug Fixes

* **clusters:** the bootstrap one-liner names the kubectl context it waits on ([b509e3b](https://github.com/xzehiox/kubelatch/commit/b509e3bd2d81d95971993ef057bd9c7113d0470b))
* **make:** dev-tls embeds its self-signed cert in issued kubeconfigs ([57509af](https://github.com/xzehiox/kubelatch/commit/57509af62cdf19d700b80ed0a9015118d2830d69))
* **web:** announce changes, title each page and meet WCAG AA contrast ([71dccc1](https://github.com/xzehiox/kubelatch/commit/71dccc114e7c845519a2948fe225a846bacff8e5))
* **web:** notices follow the language and the grant form stops alerting ([564dd15](https://github.com/xzehiox/kubelatch/commit/564dd155563d5a8dac28657059913768a2f08bf5))
* **web:** wide tables scroll in their own box on narrow screens ([903b0bd](https://github.com/xzehiox/kubelatch/commit/903b0bd6a67ce5ac384e9433040e50e5493530ae))

## [0.2.0](https://github.com/xzehiox/kubelatch/compare/v0.1.0...v0.2.0) (2026-09-27)


### ⚠ BREAKING CHANGES

* the binary inside the image moved from /kubelatch to /kubelatch-server; account-rescue commands become `/kubelatch-server user ...`.

### Features

* **cliauth:** CLI sign-in requests, approval, exchange and bearer tokens ([ff95f7e](https://github.com/xzehiox/kubelatch/commit/ff95f7e27c6cf8cd41cc0452a51a48f19fdac141))
* **cli:** kubeconfig with the exec plugin and exec-credential ([5efc7b9](https://github.com/xzehiox/kubelatch/commit/5efc7b966d088f0f6763492ab1c90bb1916b9379))
* **cli:** kubelatch client skeleton with local files and API client ([992ae66](https://github.com/xzehiox/kubelatch/commit/992ae663e7394d52c0a9f710758be35a6283de1e))
* **cli:** login with the browser or a device code, and logout ([11585a0](https://github.com/xzehiox/kubelatch/commit/11585a03cebe097697233fcb49e88a1c715de772))
* **cli:** status and credentials commands ([cb303af](https://github.com/xzehiox/kubelatch/commit/cb303af94bb5af9682489048f120aea88c929a5e))
* **config:** KUBELATCH_CLI_SESSION_TTL and its chart value ([6dbcbb6](https://github.com/xzehiox/kubelatch/commit/6dbcbb6e1c21c6fc834e51c1b3c1fb1ab5056e50))
* **credentials:** issue CLI session credentials ([af399b7](https://github.com/xzehiox/kubelatch/commit/af399b78e4247da9803f8e268d3ae4ef6c10bd7a))
* **httpapi:** accept the CLI token on self-service routes only ([1c9fca5](https://github.com/xzehiox/kubelatch/commit/1c9fca50754ee5a79b471f1b857fce9f8627023f))
* **httpapi:** kubelatch CLI sign-in endpoints ([fcc6b51](https://github.com/xzehiox/kubelatch/commit/fcc6b510ae478fe1131d3aab78663e2bf60b320b))
* kubelatch-server binaries on every release and a multi-arch image ([a17591e](https://github.com/xzehiox/kubelatch/commit/a17591e57eacdfdc325de7f6f6b7ebdddfbc4e93))
* **store:** credential kind and cli_authorizations for the kubelatch CLI ([c7be674](https://github.com/xzehiox/kubelatch/commit/c7be674212f4235ef83dc4c8d6a400c7ae391f72))
* **web:** approve kubelatch CLI sign-ins and label CLI credentials ([4f49339](https://github.com/xzehiox/kubelatch/commit/4f493393d1fa4b882005e12c3b2d6be3ec0df51c))


### Bug Fixes

* **ci:** automatic release merges only release-please's PR, fails closed and recovers a half-done release ([2301b17](https://github.com/xzehiox/kubelatch/commit/2301b1726d255b0d215af2cf9ee4761d7741cdc8))
* **ci:** warn on a stuck release PR and read as many closed PRs as release-please ([ca8fd18](https://github.com/xzehiox/kubelatch/commit/ca8fd18a63c4cf7060e30b63ab9bd17ac3c14314))
* **cliauth:** charge user-code attempts up front and test single use under concurrency ([517465d](https://github.com/xzehiox/kubelatch/commit/517465d5c21466d12fa486d094675bdc59d34d38))
* **cli:** keep waiting on a wrong callback state, never delete a newer session, back off on 429 ([e1da86f](https://github.com/xzehiox/kubelatch/commit/e1da86f99bd8f01f3ff9643364f244baa7cff079))
* **cli:** no redirects, revoke the previous server's session, harden logout and the callback ([1afa223](https://github.com/xzehiox/kubelatch/commit/1afa223646ba2b51ae9953d1b956313bbe68fac4))
* **credentials:** revoking someone else's credential is a 404 ([5d64d62](https://github.com/xzehiox/kubelatch/commit/5d64d62cddf4a036834ef08d8eb6d0f1c69cc6e7))

## 0.1.0 (2026-09-26)


### Features

* **api:** audit and control-event queries, grants visible to their subject, bot disable over HTTP ([55343ee](https://github.com/xzehiox/kubelatch/commit/55343eecd5e2ab36cd673a055c085d2755ff691e))
* **api:** catalogue of coded API errors (English text, params, nested causes) and the SPA dictionaries for it, kept in step by a test ([b112584](https://github.com/xzehiox/kubelatch/commit/b1125844e7baead0667b96e0a4fc4aacbbb0147b))
* **api:** cluster registration endpoints ([f31d529](https://github.com/xzehiox/kubelatch/commit/f31d52901940765cb51fd61bef16ace9c1c505b9))
* **api:** credentials with kubeconfig, revocation and disable cascade ([7a2d047](https://github.com/xzehiox/kubelatch/commit/7a2d047962c7c19f0330046f5ad5a0388294b760))
* **api:** every API error answers {error, code, params} from the catalogue; the English error text stays for existing clients ([38a8498](https://github.com/xzehiox/kubelatch/commit/38a8498b1f588ec3b38cbab60d956e9d6a446e00))
* **api:** GitHub login, callback, account linking, unlink, status and webhook endpoints; wire the App, state codec and membership sync ([d620c79](https://github.com/xzehiox/kubelatch/commit/d620c79b66601545cc4fd0046dd84b2207cf646e))
* **api:** grants endpoints and bot subjects ([fed140f](https://github.com/xzehiox/kubelatch/commit/fed140f6e1b8205f6b30aeaed50916be5c40c550))
* **api:** manual reconcile endpoint, reconcile triggers on grants, tokens and account changes ([0d49742](https://github.com/xzehiox/kubelatch/commit/0d497426734f2fa933c46c9b997590d6dd6aab27))
* **audit:** RequestInfo golden test and audit recorder ([6db79be](https://github.com/xzehiox/kubelatch/commit/6db79be99d21e094937cf5d81de448b421e30230))
* **auth:** admin account operations with last-admin guard and CLI create/set-password ([5d245e1](https://github.com/xzehiox/kubelatch/commit/5d245e159f7aaed7ef299daa7da578b0f21ee397))
* **auth:** argon2id password hashing with PHC strings, policy, semaphore and dummy hash ([dc3552c](https://github.com/xzehiox/kubelatch/commit/dc3552c46fcf16456866f4d73ed10cab5f810e51))
* **auth:** bots can be disabled and re-enabled; login records a corrupt hash ([a88b31d](https://github.com/xzehiox/kubelatch/commit/a88b31d2ec79f42e7ef78d46996f373c63149e1f))
* **auth:** GitHub login flow with signed state cookie, account linking, unlink, system disable and passwords only for break-glass accounts ([bb6e41f](https://github.com/xzehiox/kubelatch/commit/bb6e41f28fe8cf24d4e93413d91ec08758b34521))
* **auth:** HMAC session cookie codec, kli_ link tokens and per-IP limiter ([4704b29](https://github.com/xzehiox/kubelatch/commit/4704b292c91f230053796eb6408fb010e2a3780c))
* **auth:** login with lockout and IP limit, revocable sessions, password change and account links ([5a67de8](https://github.com/xzehiox/kubelatch/commit/5a67de848a492490a82ec048d650dab0843ff39a))
* **ci:** trust rules and the id_token exchange service ([8d5553a](https://github.com/xzehiox/kubelatch/commit/8d5553aab675027ee871382d18dee49140371c10))
* **cli:** --break-glass and set-break-glass; --password-stdin strips exactly one trailing newline ([c807c7a](https://github.com/xzehiox/kubelatch/commit/c807c7a5d3e0740ada87d3272074e16b1d61fd9f))
* **clientip:** resolve the client IP behind trusted proxies and bucket IPv6 limiter keys by /64 ([9f59279](https://github.com/xzehiox/kubelatch/commit/9f5927925d873574dce44593cb3e5301b49245f5))
* **cli:** user create and user set-password subcommands ([95a7846](https://github.com/xzehiox/kubelatch/commit/95a78461fe6677bde86a47b12765a4d7a3f9113e))
* **clusters:** API URL validation, bootstrap manifest and token validation against the apiserver ([d4de5a4](https://github.com/xzehiox/kubelatch/commit/d4de5a4a2fcb70bf056d293ebeaf1a131a53fef5))
* **clusters:** bootstrap ClusterRole bounded by resourceNames, named SSAR checks, reconciler client and notify hook ([241e03b](https://github.com/xzehiox/kubelatch/commit/241e03b48159a413a6a3ec4d02921b3105445a61))
* **clusters:** clean up the cluster's RBAC before deleting it ([7fd008f](https://github.com/xzehiox/kubelatch/commit/7fd008f0262a40ad9a58309da7cf1e408cdda7b2))
* **config:** add KUBELATCH_CI_TOKEN_TTL and KUBELATCH_GITHUB_ACTIONS_ISSUER ([ea95c0b](https://github.com/xzehiox/kubelatch/commit/ea95c0b0dea7e0376cd20cbc5e07199f53072fb6))
* **config:** GITHUB_* block for the GitHub App login (all-or-nothing, PEM private key) ([81c1dc7](https://github.com/xzehiox/kubelatch/commit/81c1dc7296de60302b908315baf284015a170bde))
* **config:** load and validate KUBELATCH_* settings from the environment ([17dd0ab](https://github.com/xzehiox/kubelatch/commit/17dd0ab1da524c4f65fb2b2eec07bfd9d5cf2436))
* **config:** milestone 3 settings, klt_ tokens and AES-GCM sealer ([55e77be](https://github.com/xzehiox/kubelatch/commit/55e77be32394b2701d0f60ebf0ea81ad9f31ac1e))
* **config:** trusted proxies, audit retention, kubeconfig CA and a normalised base URL origin ([8043566](https://github.com/xzehiox/kubelatch/commit/8043566467925013bee59ba87454a416ca32bac6))
* **deploy:** distroless image and kustomize manifests (L4 base, cert-manager, ha and ingress overlays, VAP hardening) ([fe7233d](https://github.com/xzehiox/kubelatch/commit/fe7233dc13508f31ed4f0c354b06efae31d63a95))
* English proxy messages, cluster diagnostics, tier descriptions and bootstrap one-liner; system revocation reasons stored as codes ([bfd260a](https://github.com/xzehiox/kubelatch/commit/bfd260a25bf35cfa4c62d675cf3dd1ad1175bd03))
* **github:** GitHub App client (OAuth, membership, installation token, members, org settings), webhook verification and a fake GitHub for tests ([6c7f401](https://github.com/xzehiox/kubelatch/commit/6c7f401e1dc02519503b8999c9ad03954b2c6a96))
* **github:** verify GitHub Actions id_tokens against a cached JWKS ([cf39486](https://github.com/xzehiox/kubelatch/commit/cf394866aaaff9015c05afc46d1152519f66b6e6))
* **helm:** chart skeleton with the full values, schema and golden test harness ([0e5404f](https://github.com/xzehiox/kubelatch/commit/0e5404f3a720a229a5620e94d1111d3a85a56dfb))
* **helm:** Deployment, Service, NetworkPolicy and secret handling matching the kustomize base ([d2387df](https://github.com/xzehiox/kubelatch/commit/d2387dfd15a69d77dfea649cdf6a7bc2c16a253a))
* **helm:** extraVolumeMounts for the kubelatch container, e.g. an external Postgres CA ([1b7efa3](https://github.com/xzehiox/kubelatch/commit/1b7efa33f56fd7feaaf9bc283970ad3fa29781a2))
* **helm:** ingress exposure, cert-manager Certificate, PDB, namespace and hardening policy options ([17a8ddf](https://github.com/xzehiox/kubelatch/commit/17a8ddf256121bb8dbaa9b14ce6b9e5686df6c66))
* **helm:** optional CloudNativePG database with TLS, backups through the Barman Cloud Plugin and its NetworkPolicy ([932f238](https://github.com/xzehiox/kubelatch/commit/932f238b17e2c3938d1fab76b1255ce76f81d24f))
* honour X-Forwarded-For from KUBELATCH_TRUSTED_PROXIES in the API and the proxy ([6becca8](https://github.com/xzehiox/kubelatch/commit/6becca87993c52addbdf2de57fb53e812f1f1a08))
* **httpapi:** admin subject endpoints with invitation and reset links ([03f6531](https://github.com/xzehiox/kubelatch/commit/03f6531b67add0e0656aa34d88fd361d5a7536b2))
* **httpapi:** expose require_psa in GET /api/tiers ([d0be4da](https://github.com/xzehiox/kubelatch/commit/d0be4da78fa2d0c8f40bbd8b088dfd8665d282a5))
* **httpapi:** health endpoints, JSON 404s, Status errors, embedded SPA and main wiring ([d1589c4](https://github.com/xzehiox/kubelatch/commit/d1589c4e4e3ee4f4eccd160843dc146de445bcbd))
* **httpapi:** login, logout, me, password change and account link endpoints ([cd067d6](https://github.com/xzehiox/kubelatch/commit/cd067d6857030aceac15b41a3be45edae061b075))
* **httpapi:** session middleware, CSRF protection, JSON helpers, 405/404 fixes and auth wiring ([705d4a2](https://github.com/xzehiox/kubelatch/commit/705d4a287c69d655201a5ba9c2bcdce0f799bab2))
* **httpapi:** trust rule admin API and the CI token exchange endpoint ([b1e0eac](https://github.com/xzehiox/kubelatch/commit/b1e0eacb0ec9ce1489c83874164e56db1e874149))
* **jobs:** hourly GitHub membership sync that disables leavers, all-or-nothing on errors ([675eba0](https://github.com/xzehiox/kubelatch/commit/675eba0a4d60db1c18ddd81eebdb391f09a729bb))
* **kubeconfig:** embed KUBELATCH_KUBECONFIG_CA as certificate-authority-data ([a49725b](https://github.com/xzehiox/kubelatch/commit/a49725bae623d04484cab74a6f44634688d96b24))
* **landing:** static EN/ES landing for kubelatch.com with a Hyperframes video, nginx image and smoke test ([8c54c57](https://github.com/xzehiox/kubelatch/commit/8c54c572fb29136d14cdf3378423233afdb0259f))
* per-account interface language (subjects.locale, locale in GET /api/me, PATCH /api/me/locale with a user.locale event) ([85d1008](https://github.com/xzehiox/kubelatch/commit/85d100817a8866ee4a8989454e5c4edc824b6584))
* **proxy:** impersonation proxy with header/path policy, audit and two transports ([bc3958a](https://github.com/xzehiox/kubelatch/commit/bc3958a526a0557c038d324432085ea038f3ae89))
* **proxy:** live stream registry, sweeper and mount in main ([ea14170](https://github.com/xzehiox/kubelatch/commit/ea14170dda02d73b9f7d91f17de3283c37778d61))
* **rbac:** reconciler with server-side apply, per-instance GC, proxy ClusterRole and backoff worker ([9450347](https://github.com/xzehiox/kubelatch/commit/94503478a68e579d7f11cab86468dc538c9c91f9))
* **rbac:** tier catalogue, group names and grant validation policy ([d0e8579](https://github.com/xzehiox/kubelatch/commit/d0e857933dcbceba2271902dc0ac7cab20f23530))
* **rbac:** tier ClusterRole rules, binding names and desired state from grants ([74c64da](https://github.com/xzehiox/kubelatch/commit/74c64dac145c3508ae783df842142407d58bd9e5))
* **retention:** hourly batched deletion of audit_events, control_events and spent CI jtis ([668f102](https://github.com/xzehiox/kubelatch/commit/668f1024976b74ab02e60de91a6fd32bce8d7975))
* serve TLS through the reloader, wire the client IP resolver and the kubeconfig CA, add kubelatch version ([01e3017](https://github.com/xzehiox/kubelatch/commit/01e30172ead37400f84d408f0a9f7a7256d16a03))
* **servertls:** reload the TLS pair by mtime and warn before it expires ([ff69e93](https://github.com/xzehiox/kubelatch/commit/ff69e93784292561f6eca336df950efa45633fb7))
* **spike:** TLS impersonation reverse proxy with dual transports ([e66d599](https://github.com/xzehiox/kubelatch/commit/e66d599264bd39160f6a673279c14126ac754fc5))
* **store:** audit filters with discovery exclusion and paging, control_events seq ([321818b](https://github.com/xzehiox/kubelatch/commit/321818b3db31b342f3640b2264b87ec91f835465))
* **store:** ci_trust_rules and single-use jti tables with queries ([62f0859](https://github.com/xzehiox/kubelatch/commit/62f0859bdb5e961a104405ac6381488d1e851faf))
* **store:** GitHub identity columns, break-glass flag and membership sync queries (migration 00008) ([7fd0b1f](https://github.com/xzehiox/kubelatch/commit/7fd0b1f233e927bfae89939ea406f0cb16f21bd9))
* **store:** identity migration, subjects/account_links/control_events queries and isolated test schemas ([fe7d5cd](https://github.com/xzehiox/kubelatch/commit/fe7d5cd5650292386a0a6c7bf714ca83a9e7962d))
* **store:** migration 00003 with clusters, grants, credentials and audit_events ([b510f51](https://github.com/xzehiox/kubelatch/commit/b510f5183ae87c759e56409cae99318f7322af14))
* **store:** pgx pool, embedded goose migrations and subjects table ([94f432b](https://github.com/xzehiox/kubelatch/commit/94f432bf2a8d887e2a88c5231177a224368532b8))
* **store:** reconcile state, per-cluster advisory lock and active cluster grants ([bd31fd3](https://github.com/xzehiox/kubelatch/commit/bd31fd35268bfa1f65a206f5d828fe7ce7c71c93))
* **store:** reload the sslrootcert CA file when it changes, so a renewed CloudNativePG CA is picked up without a restart ([a93fd39](https://github.com/xzehiox/kubelatch/commit/a93fd39aa08cda1a268f4b1a76fce7054ee5cf64))
* **web:** account link page to set a password from an invitation or reset link ([e5116c1](https://github.com/xzehiox/kubelatch/commit/e5116c10d04cd76d0ca3f0146eb5bc55db9230e4))
* **web:** admin audit page with filters, detail and the control-plane log ([26a022d](https://github.com/xzehiox/kubelatch/commit/26a022de2e90f993c6e5bd40833da520d14c16b8))
* **web:** admin clusters page with bootstrap, tokens, status, reconcile and delete ([4aa749c](https://github.com/xzehiox/kubelatch/commit/4aa749c2a1bf6db49dd81917105486544856d4b1))
* **web:** admin credentials inventory with issuing for any subject ([c4a1026](https://github.com/xzehiox/kubelatch/commit/c4a102662a83bc828b0b83b06426e849fa64043a))
* **web:** admin grants page with mirrored rules, PSA hints and cluster-admin expiry ([dda8aad](https://github.com/xzehiox/kubelatch/commit/dda8aad6fe94bd98eb952e32e64c89a9efb49f9b))
* **web:** admin users page with invitation and reset links ([ab66640](https://github.com/xzehiox/kubelatch/commit/ab66640adc06218167f997912e11a7baedbb6341))
* **web:** CI page with trust rules and the workflow snippet ([962bebf](https://github.com/xzehiox/kubelatch/commit/962bebfec99514cde0e9d498cc5a902426b8256d))
* **web:** Clusters, Permissions and CI read the en/es dictionaries; the CI workflow snippet is English like the example ([5bdfde9](https://github.com/xzehiox/kubelatch/commit/5bdfde9839652674906fd4a77b75bc77fe350fc6))
* **web:** create, disable and enable bots from the users page ([f6032b9](https://github.com/xzehiox/kubelatch/commit/f6032b991e2e845560e5cff0a22085b0135b67b6))
* **web:** GitHub login, link from invitation and account pages, GitHub identity and break-glass in the users page ([0cc225c](https://github.com/xzehiox/kubelatch/commit/0cc225c38fcfb9d1d0ba13ce2b1518b8c228c34b))
* **web:** global PSA warning on Permisos and relative periods on Auditoria ([deb1e1d](https://github.com/xzehiox/kubelatch/commit/deb1e1dd138349fc11571629d23b8d04291f1e47))
* **web:** header, login, account link and My account read the en/es dictionaries ([b976d1e](https://github.com/xzehiox/kubelatch/commit/b976d1e64712e6c7bf13d93f56162a3bd2f2f8f8))
* **web:** Home and the shared components read the en/es dictionaries; tier descriptions and system revocation reasons are translated ([5a906f3](https://github.com/xzehiox/kubelatch/commit/5a906f3f7c4610b2a9302e9b57a61bfd1396b9d4))
* **web:** i18n core: locale resolution and storage, typed en/es dictionaries, fill(), coded API errors translated with a server fallback, formats per locale ([6731bef](https://github.com/xzehiox/kubelatch/commit/6731bef7f085c3bf0a81f1bca87c44980f9b8159))
* **web:** jsdom test setup, API client for clusters, grants, credentials and audit, pure helpers ([8e15275](https://github.com/xzehiox/kubelatch/commit/8e15275ee5a392c72f4bd70ab402f545e85f856a))
* **web:** kubelatch logo (a key with a heptagonal bow) in the app header, login and favicon; docs logo, favicon and black header ([6628e02](https://github.com/xzehiox/kubelatch/commit/6628e02169e6aa0343fa60ff320ff8316b303e00))
* **web:** LocaleProvider (account, browser choice, browser language, English), language selector in the header and on the login page, &lt;html lang&gt; ([94572a0](https://github.com/xzehiox/kubelatch/commit/94572a0c4fb61ccdea5ee72b2cf3c624e4bbfdac))
* **web:** minimal Vite + React + Tailwind SPA with vitest ([42c1dd0](https://github.com/xzehiox/kubelatch/commit/42c1dd033fa05e0b330e3965aed0ae45441e0cc2))
* **web:** router, query client, API client, login and my-account pages ([005ed34](https://github.com/xzehiox/kubelatch/commit/005ed34b1770d4eb84fc3002561d2e6343b5e0d2))
* **web:** shared dialog and table components, developer home page with credentials and activity ([ba30d40](https://github.com/xzehiox/kubelatch/commit/ba30d40a6a3609abd8847604c34bccea637f3817))
* **web:** Users, admin Credentials and Audit read the en/es dictionaries; formats require a locale, errorMessage is gone and a test keeps Spanish literals out of the code ([1d28e17](https://github.com/xzehiox/kubelatch/commit/1d28e1775aa36dd3cbbf0bca5a3e4cc07367d811))


### Bug Fixes

* **api:** a «Mi cuenta» GitHub callback only links for the session that started it, and member_removed webhooks need the configured organization ([7449f5c](https://github.com/xzehiox/kubelatch/commit/7449f5ce8c7b17b5e70ac64b6a0811105f00a445))
* **api:** add cause.reconciler_client for the reconciler client error, and translate cause codes only in the {cause} hole ([26af64c](https://github.com/xzehiox/kubelatch/commit/26af64cec9d41b683a3e0ed37b5644f9524556bc))
* **api:** classify grant creation errors and test the namespace lookup 500 path ([b19f760](https://github.com/xzehiox/kubelatch/commit/b19f760d593fd1898a323dcd1e604febca0fcadb))
* **api:** namespace lookup error mapping and cluster token rotation tests ([d33047f](https://github.com/xzehiox/kubelatch/commit/d33047f93e36c855636e74ff4d1eeffedd6b7177))
* **api:** webhook answers 413 only for oversized bodies and 415 for non-JSON deliveries, callback server errors redirect to ?error=server, and tests for the last-admin webhook path ([9660706](https://github.com/xzehiox/kubelatch/commit/966070649aa2ce4a0faa9b9a40d9892e9a1ce115))
* **audit:** detach auth failure rows from request cancellation and document the audited path ([a41939d](https://github.com/xzehiox/kubelatch/commit/a41939d037476a99bdf5708cea42c2d6d62f2090))
* **audit:** stamp last_used_at detached from the client's cancellation ([ea78945](https://github.com/xzehiox/kubelatch/commit/ea78945d5786bc4fcaf41db79ffe1823b6005839))
* **auth:** answer a corrupt password hash like any failed login ([2c0ff59](https://github.com/xzehiox/kubelatch/commit/2c0ff59ace85c1c5a184d90987749688a452cb53))
* **auth:** bound display name and email length ([0f30f6e](https://github.com/xzehiox/kubelatch/commit/0f30f6e3750e2d17271978df312e0c32a1e955a6))
* **auth:** close login, link and change-password races around argon2 ([1b5a20a](https://github.com/xzehiox/kubelatch/commit/1b5a20af4b163f47688469d45d2e5df0a37d8968))
* **auth:** detach the subject hook from the request context ([2d75bba](https://github.com/xzehiox/kubelatch/commit/2d75bbab2e1aea80f562d87db008cd90103d6bcf))
* **auth:** fail closed on unreadable org 2FA settings, compare-and-swap the GitHub login stamp on the identity, rate limit the callback per IP, bind system disable to the observed GitHub id and distinguish already_linked in the me flow ([679731b](https://github.com/xzehiox/kubelatch/commit/679731b6219489b6febc6103cbc6eb8c5f78fef9))
* **auth:** lock-first last-admin guard and revoke pending links on disable and set-password ([394c0ff](https://github.com/xzehiox/kubelatch/commit/394c0ffefd9106bebc5fa2bfd5bd8303827cb260))
* **auth:** microsecond session iat closes the same-second revocation gap ([2c2f9b8](https://github.com/xzehiox/kubelatch/commit/2c2f9b88c32770c86259876c533875279008126d))
* **auth:** rate-limit and log wrong current passwords on change; no rehash on lock-refused login ([59ac275](https://github.com/xzehiox/kubelatch/commit/59ac275051caed9820a4cdf75e375f4b2fe021ce))
* **auth:** run argon2 outside transactions and compare-and-swap the verified hash on login ([b708c46](https://github.com/xzehiox/kubelatch/commit/b708c464295a5fea2e3ea13c0f63e1777881fc6e))
* **auth:** strict bounded PHC parsing and password edge-case tests ([51bbcf6](https://github.com/xzehiox/kubelatch/commit/51bbcf6c3e39a4bbdf7a3c64bc8601461bcd5dc8))
* **ci:** release only the green release merge commit, start at 0.1.0 and republish by dispatch ([ec0f385](https://github.com/xzehiox/kubelatch/commit/ec0f385a6211f1b5776431dd1797e5560343fda5))
* **ci:** sanitize the credential note and separate bot_disabled from a data-inconsistency error ([51dd665](https://github.com/xzehiox/kubelatch/commit/51dd6655d763318e0e92372108951d6049b487a1))
* **clusters:** classify cluster validation errors and reject malformed CAs ([3b98b45](https://github.com/xzehiox/kubelatch/commit/3b98b4587210564bd5ea93012dc5bbe44c938b0e))
* **clusters:** finish a cluster delete after a client disconnect and report a held lock and denied cleanup ([eeb424b](https://github.com/xzehiox/kubelatch/commit/eeb424b8b70ff3700abb156e35b31c5f95920278))
* **config:** bound GitHub App RSA key size and redact issuer userinfo in errors ([24ccca6](https://github.com/xzehiox/kubelatch/commit/24ccca6bc1a41237fea4e2c11933b6993a31f5f6))
* **config:** bound TTL parsing and validate protected namespace names ([e8bbe23](https://github.com/xzehiox/kubelatch/commit/e8bbe23e7e3e7ac3a8c2fd6f932ffa2f75564e70))
* **config:** bracket IPv6 base URLs, bound trusted proxy prefixes, re-encode kubeconfig CA certs, enforce minimum audit retention ([dce8969](https://github.com/xzehiox/kubelatch/commit/dce896961e091444b5b3a3a8fb05850b4212d31a))
* **config:** reject base URL with query, fragment or user info ([8e61067](https://github.com/xzehiox/kubelatch/commit/8e610677d32db7f6f0d190a981f189b791addc69))
* **credentials:** sanitize kubeconfig names, lock subject on issue and stable listing order ([c1f772a](https://github.com/xzehiox/kubelatch/commit/c1f772a1fec095d903f224623d4501e421e76cb0))
* **credentials:** stop caller Details from overwriting core audit keys ([9d7547f](https://github.com/xzehiox/kubelatch/commit/9d7547f22a86ffd433754dc7bb76ba0ce0051029))
* **deploy:** leave GITHUB_ORG commented in the base config so a fresh install starts in password mode ([17ee2bb](https://github.com/xzehiox/kubelatch/commit/17ee2bb7fd74ba636bcd835c8850c6e3bbb42c8b))
* **deploy:** put overlay resources in the kubelatch namespace; update stale lock-key notes ([bea3923](https://github.com/xzehiox/kubelatch/commit/bea3923aedbb0cf5f2a05e4dbe672f8d20f9b709))
* **deploy:** restrict the ingress overlay to the ingress controller with a NetworkPolicy ([4d19b05](https://github.com/xzehiox/kubelatch/commit/4d19b050e04548468f83767bf2e54a35128361ca))
* **docs:** safer kustomize move and CNPG restore, qualified CNPG resources ([b1bb1df](https://github.com/xzehiox/kubelatch/commit/b1bb1df124c9fe4ed7834b69d9c2725cf47fdbfc))
* **e2e:** no grep -q at the end of a pipefail pipeline, which failed the install test in CI at random ([9a0608e](https://github.com/xzehiox/kubelatch/commit/9a0608ef0cb29d055601aaca9c039b1e66672983))
* **github:** detach JWKS refresh from caller cancellation, cap stale-key age, harden JWK validation ([72d9043](https://github.com/xzehiox/kubelatch/commit/72d9043f74505459a32a41bc34ef441c43d5d008))
* **github:** enforce the stale-key ceiling on every path and stop unknown kids extending the back-off ([e4ad2ec](https://github.com/xzehiox/kubelatch/commit/e4ad2ecd47db737754671285fc420445ea656b9a))
* **github:** validate member pagination host, send JSON Accept on OAuth exchange, bound installation token expiry and id, and harden the fake App JWT check ([313bb4a](https://github.com/xzehiox/kubelatch/commit/313bb4a28b4aa8bbb31ed903d73c22b64bf297cc))
* **helm:** Argo CD never deletes or prunes the objects Helm keeps ([c1db61b](https://github.com/xzehiox/kubelatch/commit/c1db61b2c1875da77c65fda6048e5af4ff0b3628))
* **helm:** encryption key advice that can never rotate the key ([9919518](https://github.com/xzehiox/kubelatch/commit/99195186a0751252fcfff9bce7d679d62e34c8a1))
* **helm:** ingress needs its NetworkPolicy; PDB check also catches --set ([901aa7c](https://github.com/xzehiox/kubelatch/commit/901aa7ca09e6e4ed9ae98b7c801a4aa2385df3d9))
* **helm:** keep the terminating pod serving until kube-proxy stops routing to it ([ea35d19](https://github.com/xzehiox/kubelatch/commit/ea35d19419ec26203e55d1ba65dabf22df34c1a2))
* **helm:** move the cert-manager check out of the secrets branch and add ingress/PDB/annotation validation ([17f30d3](https://github.com/xzehiox/kubelatch/commit/17f30d3be4a243cb4009d1d5bace2386ac3d6f64))
* **helm:** reject bootstrap.&lt;method&gt;.secret with postgres.mode=cnpg, since kubelatch reads the operator's &lt;release&gt;-db-app Secret ([b3b2f20](https://github.com/xzehiox/kubelatch/commit/b3b2f208e02e64ca03e0c74a4a015b4fcc469544))
* **helm:** stop generateEncryptionKey from silently rotating or overriding a key ([e378463](https://github.com/xzehiox/kubelatch/commit/e378463bb303532eff034294fd4dd18355660724))
* **helm:** verify-full against the CloudNativePG CA, force the kubelatch database on restore/import, keep the backup objects and narrow the operator peer ([88fc19c](https://github.com/xzehiox/kubelatch/commit/88fc19cb2afdc2c8e9c268748a22dfea41c0e280))
* **httpapi:** reject invalid UTF-8 and NUL bytes in free-text filters ([6f421de](https://github.com/xzehiox/kubelatch/commit/6f421de499e8d67bddf0941e6f44dfadaaa974f8))
* **jobs:** accurate partial-failure logging, skip mid-pass links, silence shutdown cancellation, break-glass scope note, and test coverage for skip/break-glass/link-race paths ([9674555](https://github.com/xzehiox/kubelatch/commit/9674555c7fed9f38c9c91e0405e55f4e4eb08867))
* **jobs:** report a retention pass cut short by the lock as partial work, not skipped ([5655ccf](https://github.com/xzehiox/kubelatch/commit/5655ccf524b507c165418de8a7c0a229527920bf))
* **landing:** 401 audit row without subject and the proxy's revoked reason in the video, cluster instead of tier on credentials, headers and HSTS on /media/, hashed media names, stricter smoke test ([7273365](https://github.com/xzehiox/kubelatch/commit/7273365e89aea58034082adc17f61ec36c510ef4))
* **proxy:** cut live streams on shutdown and complete their audit rows ([5ca7980](https://github.com/xzehiox/kubelatch/commit/5ca79800785973faeebbbd793df90c6b46cfa38c))
* **proxy:** forward and audit the cleaned query string ([bf743f7](https://github.com/xzehiox/kubelatch/commit/bf743f7c80d0ef2b9c1c7cfdae5f33c14cc25133))
* **proxy:** reject malformed cluster ids with 400 before authenticating ([2fc38f6](https://github.com/xzehiox/kubelatch/commit/2fc38f6fe05bc56152377f3c2c06f38ab5a96d63))
* **proxy:** reject percent-encoded paths and stop double-decoding the upstream URL ([665052a](https://github.com/xzehiox/kubelatch/commit/665052afaf103ee66000fe161d5ad6bfe8da733f))
* **rbac:** built-in protection for zero-value policy and clearer TTL messages ([be2e4fb](https://github.com/xzehiox/kubelatch/commit/be2e4fbb3b47bff88f59bc471807444c43a11ea5))
* **rbac:** log a failed pass once and drop its stale retry entry ([f8797eb](https://github.com/xzehiox/kubelatch/commit/f8797eb2bb11d5972bcb856f5bf41f9142695b8d))
* **rbac:** record timed-out passes, requeue busy triggers and safer error handling ([c4af496](https://github.com/xzehiox/kubelatch/commit/c4af4961dd782dd4bc7a9d48e200aa83dcac4566))
* **rbac:** require PSA for debugger and tighten ownership and desired-state checks ([7d3c333](https://github.com/xzehiox/kubelatch/commit/7d3c3331befe32f8101d029d8296666a858930b1))
* **spike:** isolate kind kubeconfig from ~/.kube/config; kadmin/kproxy as functions ([1ef12e7](https://github.com/xzehiox/kubelatch/commit/1ef12e7294880f1f2f43c908c54ad0a57c9de117))
* **spike:** log rejected and aborted requests, strip X-Real-Ip and X-Forwarded-*; exec built binary ([6e44c5e](https://github.com/xzehiox/kubelatch/commit/6e44c5e8eaeb1a9189bdbd4162df3cef3c53249c))
* **store:** 00002 down migration no longer fails with local users ([607946f](https://github.com/xzehiox/kubelatch/commit/607946f06f14cdf21f3d1e854dd7aed9cd0406e6))
* **store:** atomic login failure counter, lock-aware success, per-schema migration lock in tests ([0250470](https://github.com/xzehiox/kubelatch/commit/025047092a1e3fae4f51084c5e7eb7d7d5895736))
* **store:** close expired grants on re-grant; stricter audit and control event guards ([47f90ce](https://github.com/xzehiox/kubelatch/commit/47f90ceb4d025bca21e4a7c0356f9a7f86c3e137))
* **store:** schema-scope the last-admin guard advisory lock, and log an error at startup when GitHub login is on and no admin can log in ([ca3b64d](https://github.com/xzehiox/kubelatch/commit/ca3b64dd2b46848936aaa455ff829ae4a8abdffe))
* **store:** scope advisory lock keys to the schema ([44b3f36](https://github.com/xzehiox/kubelatch/commit/44b3f36accd7ebdfb32bf1aa25540ce02fa4fab8))
* **store:** trust rules only for bots and a concurrent jti test ([7ab5847](https://github.com/xzehiox/kubelatch/commit/7ab58470bd401dd9eae0f5a061d4d0180d518f34))
* **web:** clear query cache on identity switch ([6d3728e](https://github.com/xzehiox/kubelatch/commit/6d3728e265f0d0539a15cf8413228d4b08feeb3a))
* **web:** clear the link token from the URL as soon as it is read ([42052be](https://github.com/xzehiox/kubelatch/commit/42052bec163e7b228576d59e884cee111da16a06))
* **web:** drop a queued locale save whose account is gone, restore the server-confirmed account after a failed chain of saves, keep only the exact me query on an identity switch ([a59a876](https://github.com/xzehiox/kubelatch/commit/a59a8766c6e673e3103828d38eef70f1dfa3b52e))
* **web:** explain the disable confirmation revokes credentials at once ([e576535](https://github.com/xzehiox/kubelatch/commit/e576535dd4109a0ef255835d44c398b4d90e9611))
* **web:** fill() accepts camelCase holes (four interface phrases showed {noRef}-style placeholders), the kubeconfig path example is translated, and a test keeps the holes of both languages in step ([168df92](https://github.com/xzehiox/kubelatch/commit/168df92e9fa2d92b8aee3519cea4b764be6a8cdb))
* **web:** guard showModal against StrictMode double effects ([4568c7a](https://github.com/xzehiox/kubelatch/commit/4568c7ae5ca4cea051bff8d1c7e003a4beb80880))
* **web:** identity switches keep the me query so the locale follows the new account, serial locale saves, rollback of a failed save, no late save after sign-out ([00cee7b](https://github.com/xzehiox/kubelatch/commit/00cee7be3534c37ac4a1f7fad0487f95a7737f9b))
* **web:** keep the cluster-admin shortcut under the tier's max TTL ([832f63b](https://github.com/xzehiox/kubelatch/commit/832f63b67f57a5611125855793d4e78823702d8c))
* **web:** mark client-side password-policy message as an alert ([951a3de](https://github.com/xzehiox/kubelatch/commit/951a3deb1a60c91f13e2799c50df3102dfe84849))
* **web:** plural agreement in the login methods error ([2d3ba08](https://github.com/xzehiox/kubelatch/commit/2d3ba08d459ca7b79f731d3b720713aaaeb0f411))
* **web:** purge one-time links from the mutation cache and open the link dialog modally ([d2dd332](https://github.com/xzehiox/kubelatch/commit/d2dd33214306c65402b9ca3def50a5d8740c1a14))
* **web:** reset the bootstrap tokens mutation after save and on reopen ([81013b2](https://github.com/xzehiox/kubelatch/commit/81013b26bd9fa12f3e38edbf2a1d32da4dca37c4))
* **web:** reset the issue form when the admin switches subject ([04e1c19](https://github.com/xzehiox/kubelatch/commit/04e1c19c408f4a62ea0c05e13acc0783f491eca3))
* **web:** scope home page to the signed-in subject, harden dialog and form details ([7dc35c1](https://github.com/xzehiox/kubelatch/commit/7dc35c1eb5b50005d1af02db324b7c9b6d7aff9b))
* **web:** show an error on the login page when the access methods cannot be loaded ([1f03f30](https://github.com/xzehiox/kubelatch/commit/1f03f3010325656c8786afc14edee1c3dedb0485))
* **web:** Spanish UI copy to match lang=es ([9ab683d](https://github.com/xzehiox/kubelatch/commit/9ab683d02ca529b5ac15c197e5007ceaa5bc08b1))
* **web:** state the CI trust boundary and align the workflow snippet with the example ([66895aa](https://github.com/xzehiox/kubelatch/commit/66895aa947b7d1a6c0d5cb4acede76cdad31c4cb))
* **web:** translate cause codes only in the {cause} hole, ignore Object.prototype names as error codes, cover the navigator language fallback ([4569606](https://github.com/xzehiox/kubelatch/commit/4569606922a83a619f3a2f2ff743526f01dfd120))
