Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742203;
	b=ZxNNQmHRsiramtEvMKjHMtUtKEwT98lZZLKKZ9vNWIVBhI7DXJRjNvxlvJgm/oNp58VA
	 rlOWbHgBqgrvYT95OI7xdXn8ukQq4cI8xid/hlZa9hPjdoSqFenrMBiumBAVOpsTyPfXm
	 BDW9RBsziWxZv43O6GUS+Ddas/TxHtfBSaK3dh4AJKVDVtOThMEUJJP9heafsZjZcO2Bk
	 EENFZADNBZ8WB+oCwdCbwj0B3DW5assUiZsBFg2olQ817r1u9iKs5lAEld5Ftgxeq8MKf
	 oCVOSPgy3lSQhImE+HmAVosHO00YeOvuaYdhr7cLUcjk+iyTyF5Ss8hkZKV8AyHhrNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:Received:From:In-Reply-To:
	 References:MIME-Version:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=8bbUmiQgAFFMiiHpm/ItVaw+U4JGgk2HKsFlETCS458=;
	b=Xo+rH6LYC9N0Q5Mx8pVKtu0durv/2WXjw3bkLO+FdehxcpT72yN3kV10ZiGXjoFUj1Rq
	 oXA5Wm9l27/NhjHDju5tiqXRoBHovlYS+3StZGhSfXOrpX0NT8v4mt8ufrJbphDQ5s/4U
	 6SCRPNXX+261GBn3VlnG1+NvLwEA8jkmE8DR025wzGSEE8j4XW0SbJR+MQPHz7WNHxYWM
	 1NyzBW+4pY2tWMDbizydhziQ7s4tML+A7QE9KIfdREfc8VK+ivnopKiy77Sru7z4NaR1E
	 8jpBLeJo6OSoJRkejQavAKTomDbRHcpTDsT4C0xMAtFQtHkuC3YmvuU6TYIAWvl+/2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=KH4SBpje;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71396606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71396606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=KH4SBpje
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c51d016c75dso94617566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795742201; x=1796347001; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bbUmiQgAFFMiiHpm/ItVaw+U4JGgk2HKsFlETCS458=;
        b=KH4SBpje5a1K1izWHZbKoh9WQgsePIfD8zgQOlEaZZCMQFINzScAhbDsL/f8ivlQCe
         E2Mmypxsw0SaiNc5cvFABdhvqp2xqsZZjzKXX2anMnhhJ9VWCF+e6WVe2PFMhd+RkjQ1
         BeLp4EyVmkOZU6IxqnlHcl6tt4QcJ9bILEX3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742201; x=1796347001;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bbUmiQgAFFMiiHpm/ItVaw+U4JGgk2HKsFlETCS458=;
        b=HtePljS3GjCyccaaSVqT/gxWU9W9m1n78IIsJ5OkYqEydDn58yQjnPAn+GdXtFBZfT
         4GDRuDqs7Femo0M1rI80Te37Zs9sbVfwSzBRWUI2+p+J3yrXkM2cldMS0+UjId2s7+vQ
         JsTe7EODCZlsG4YHL251E7uwFCFlEmllF7s3io5f1alBYUYGVmCEKdBqF3KKM+DPJiNf
         YCi1t4hXkG0+OkAh3k8m+WU+f2S82p6rayt/H1VcxsWZuGPY7SUISI4A1CtAYhFagqbk
         4Gfj4xtBe40YMmbkGlwOV/JJfsQv4zQjipCs08KgKrtTS7naQYZAzqLROhPpXIlWho5a
         6BtQ==
X-Forwarded-Encrypted: i=1; AL+hErG2zFSK4O2anjSjHgm+vx2dTCi3WqXUGk95nRvd/UmCxllrALTkE1QlnZU4fqt4rl77QgSGT1GrFWdoA/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TjgmR5+C9EJfee+nj609K8JJ7gBsRuRLG5nOj7lOWG5WxrBiu
	YfqhcdMLp3N/NBzYj6ZjUfLjkNq6Cevy7jTL9nWpiJjyUYTLkD3YKtWs9D2AdKB+m+M1K7yFDFe
	+dE5yX04=
X-Gm-Gg: AZFdTZfI9A3jWGooi0Ka04pO632qkl+UREIjGRO/LSVYo+l5AC+Ye49EtYBF97TYIP4
	XKMXyBKFy95UPavRvKFKfDi3csmVQCHcHBwZJ5TSk5WHH+WtpKrJlXm4eT0rjVyMZLymn5l5eBS
	1Ld0tWvPxyKPh8Y4BNiXgr2Pzx/LUN/WxsxfaytmfXkdmXTiJWzqGTK4pJLDGkcFpDruKz/S5k9
	fovSz9F263dVJrNdijDlAO871yVEVekRB1q6/JPLO+rCemi7NPdElwWgv85XpGk9utKBGizlndK
	nRuhB3cwpclD/1YIRy3iUtnST2979zIoMJHGTKjzpUdP023ato6t/StUQJ9BHtEkI7QUykHoub/
	pe8cz0W3tBtlK0Qf7A4YzSU4ngap05vuj8biEeKcacwQ5hKkvT38VxefhKEtFr9M06twGKDtd/X
	LO7elfoDo0sbl5cleGijoSgLd/D14iDO4I5ySHNqSRWrqzvcVRu+4ruCJb7Kf9IgWaajEjAiNas
	GDtUwDE8FzHzYLBRFJVs1bzIR5Fz4hUnxQYHzvO6xYSKLOnqnGPNlug8LBXKTnChisG8YPColop
	QP/RJ/aH9aSQm5/sTMM85lVvirbZdYc5A4jYJlTGhib7bv3IJuL1Yn4Pr38zqkMr/0+JpcYfQzk
	FpA8=
X-Received: by 2002:a17:907:f447:b0:c51:3b74:9d07 with SMTP id a640c23a62f3a-c513b74a25fmr1899510366b.18.1795742200692;
        Thu, 26 Nov 2026 17:16:40 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm821117266b.84.2026.11.26.17.16.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 17:16:40 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so11773360a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:16:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEZ2Ax68NTLMc0z3aqpY+Sb6XYq5BR9NJeFa9UTQWXzSbd/+c7obqev8HI39PHGSpZYm+yVjXj7HavQIzs=@vger.kernel.org
X-Received: by 2002:aa7:db57:0:b0:6b7:e3d8:20ec with SMTP id
 4fb4d7f45d1cf-6ba37d17fd2mr11839925a12.11.1795742200042; Thu, 26 Nov 2026
 17:16:40 -0800 (PST)
Received: from 425495914135 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Nov 2026 19:16:39 -0600
From: Linus Torvalds <torvalds@linux-foundation.org>
In-Reply-To: <20261127000015.3662267-2-julianbraha@gmail.com>
References: <20261127000015.3662267-1-julianbraha@gmail.com> <20261127000015.3662267-2-julianbraha@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 19:16:39 -0600
X-Gmail-Original-Message-ID: <CAHk-=wjcmmgrJy6rknMOTJ76O92QSAMSUaUPKC6N=pASPsxPmA@mail.gmail.com>
X-Gm-Features: Aa3M54pgWyN5s5G-VkTeo0uIphvPKUryXChPTRM1O_ZDzrMUc6h0lLQONKzLQHo
Message-ID: <CAHk-=wjcmmgrJy6rknMOTJ76O92QSAMSUaUPKC6N=pASPsxPmA@mail.gmail.com>
Subject: Re: [PATCH 1/5] scripts: add bit count parameter back to host hash functions
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, samitolvanen@google.com, ljs@kernel.org, 
	david.laight.linux@gmail.com, sashal@kernel.org, lzsx618@gmail.com, 
	zuoan.penguin@gmail.com, petr.pavlu@suse.com, jani.nikula@intel.com, 
	xur@google.com, sidnayyar@google.com, robertusdchris@gmail.com, 
	acourbot@nvidia.com, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Nov 2026 at 16:00, Julian Braha <julianbraha@gmail.com> wrote:
>
> Accordingly, adjust the callers of 'hash_32()' and 'hash_ptr()' to use
> the additional parameter. This is a pure refactor (no functional changes),
> so pass 32 to preserve the existing behavior.

I think this is the wrong approach.

I'd suggest hiding the size of the hash table in the table itself, sinc
ethey are all constant sizes.

You can do it with some typedef tricks - not exactly pretty macros, but
the end result ends up pretty nice from a user standpoint.

Something like the appended TOTALLY UNTESTED patch.  It builds, but it's
literally a quick hack.

What it does is to turn each hashtable into a 'union' type that has the
hashtable head array (as 'hlist[]'), and then a special 'hash_bits[]'
array.

And the 'hash_bits[]' array isn't actually used as an array, it's
literally just used for its size: it's the number of bits the hash table
has.

So now you can take such a hashtable type, and always turn it into the
number of bits with just

   sizeof(hashtable.hash_bits)

so now the hash table itself inherently carries its size in bits with it
- no need for 'ilog2()' or any other crap to calculate the bits.

And at that point, you can now just use the high bits of the hased
value, and you don't need to pass in any hash table sizes.

You can actually even pass pointers to these things around, but you have
to do it with that original named type, because the size is carried in
the *type* itself, and it's not just an anonymous array.  Nothing in the
tree does that

We can't use this trick in the kernel, because the kernel hash tables
aren't all fixed sizes.  But for the scripting code, this should make
the hashing really syntactically simple because the size is always
there.

NOTE NOTE NOTE! This is untested crap.  It shows the *concept*.  It
might even work.  But it might also do unspeakable things to your pets.
Don't trust my word for it.  Look at the code and test it.

              Linus

---

 scripts/gendwarfksyms/die.c           |  2 +-
 scripts/gendwarfksyms/gendwarfksyms.h |  2 +-
 scripts/gendwarfksyms/kabi.c          |  2 +-
 scripts/gendwarfksyms/symbols.c       |  4 ++--
 scripts/gendwarfksyms/types.c         |  2 +-
 scripts/genksyms/genksyms.c           |  2 +-
 scripts/include/hashtable.h           | 23 ++++++++++++-----------
 scripts/kconfig/expr.c                |  2 +-
 scripts/kconfig/internal.h            |  8 ++++----
 scripts/kconfig/symbol.c              |  2 +-
 scripts/kconfig/util.c                |  2 +-
 scripts/mod/modpost.c                 |  2 +-
 12 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
index 052f7a3f975a..d475f4a71207 100644
--- a/scripts/gendwarfksyms/die.c
+++ b/scripts/gendwarfksyms/die.c
@@ -9,7 +9,7 @@
 #define DIE_HASH_BITS 16

 /* {die->addr, state} -> struct die * */
-static HASHTABLE_DEFINE(die_map, 1 << DIE_HASH_BITS);
+static HASHTABLE_DEFINE(die_map, DIE_HASH_BITS);

 static unsigned int map_hits;
 static unsigned int map_misses;
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h
b/scripts/gendwarfksyms/gendwarfksyms.h
index 32cec8f7695a..ad6ff6b8a5c3 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -208,7 +208,7 @@ void die_map_free(void);

 /* A cache for addresses we've already seen. */
 struct cache {
-	HASHTABLE_DECLARE(cache, 1 << CACHE_HASH_BITS);
+	HASHTABLE_DECLARE(cache, CACHE_HASH_BITS);
 };

 void cache_set(struct cache *cache, unsigned long key, int value);
diff --git a/scripts/gendwarfksyms/kabi.c b/scripts/gendwarfksyms/kabi.c
index e3c2a3ccf51a..61b68a6d13a5 100644
--- a/scripts/gendwarfksyms/kabi.c
+++ b/scripts/gendwarfksyms/kabi.c
@@ -87,7 +87,7 @@ struct rule {
 };

 /* { type, target } -> struct rule */
-static HASHTABLE_DEFINE(rules, 1 << RULE_HASH_BITS);
+static HASHTABLE_DEFINE(rules, RULE_HASH_BITS);

 static inline unsigned int rule_values_hash(enum kabi_rule_type type,
 					    const char *target)
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index 42cd27c9cec4..1f302c993a84 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -9,9 +9,9 @@
 #define SYMBOL_HASH_BITS 12

 /* struct symbol_addr -> struct symbol */
-static HASHTABLE_DEFINE(symbol_addrs, 1 << SYMBOL_HASH_BITS);
+static HASHTABLE_DEFINE(symbol_addrs, SYMBOL_HASH_BITS);
 /* name -> struct symbol */
-static HASHTABLE_DEFINE(symbol_names, 1 << SYMBOL_HASH_BITS);
+static HASHTABLE_DEFINE(symbol_names, SYMBOL_HASH_BITS);

 static inline unsigned int symbol_addr_hash(const struct symbol_addr *addr)
 {
diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
index 9c3b053bf061..adf2e82410bb 100644
--- a/scripts/gendwarfksyms/types.c
+++ b/scripts/gendwarfksyms/types.c
@@ -100,7 +100,7 @@ static void type_expansion_append(struct
type_expansion *type, const char *s,
  * const char *name -> struct type_expansion *
  */
 #define TYPE_HASH_BITS 12
-static HASHTABLE_DEFINE(type_map, 1 << TYPE_HASH_BITS);
+static HASHTABLE_DEFINE(type_map, TYPE_HASH_BITS);

 static int __type_map_get(const char *name, struct type_expansion **res)
 {
diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index 83e48670c2fc..d1b8f36d63c7 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -24,7 +24,7 @@
 #include "genksyms.h"
 /*----------------------------------------------------------------------*/

-static HASHTABLE_DEFINE(symbol_hashtable, 1U << 12);
+static HASHTABLE_DEFINE(symbol_hashtable, 12);
 static FILE *debugfile;

 int cur_line = 1;
diff --git a/scripts/include/hashtable.h b/scripts/include/hashtable.h
index 45abcb12bfce..0d8bb8eb178c 100644
--- a/scripts/include/hashtable.h
+++ b/scripts/include/hashtable.h
@@ -5,15 +5,19 @@
 #include "array_size.h"
 #include "list.h"

-#define HASH_SIZE(name) (ARRAY_SIZE(name))
+#define HASHTABLE_DECLARE(name, bits)			\
+	union {						\
+		struct hlist_head hlist[1 << (bits)];	\
+		char hash_bits[bits];			\
+	} name

-#define HASHTABLE_DECLARE(name, size)		struct hlist_head name[size]
+#define HASHTABLE_DEFINE(name, bits) \
+	HASHTABLE_DECLARE(name, bits) =	{ { [0 ... ((1 << (bits)) - 1)] =
HLIST_HEAD_INIT } }

-#define HASHTABLE_DEFINE(name, size)						\
-	HASHTABLE_DECLARE(name, size) =						\
-			{ [0 ... ((size) - 1)] = HLIST_HEAD_INIT }
+#define HASH_BITS(name) (sizeof((name).hash_bits))
+#define HASH_SIZE(name) (1ul << HASH_BITS(name))

-#define hash_head(table, key)		(&(table)[(key) % HASH_SIZE(table)])
+#define hash_head(table, key)	(&(table).hlist[(unsigned)(key) >>
(32-HASH_BITS(table))])

 static inline void __hash_init(struct hlist_head *ht, unsigned int sz)
 {
@@ -26,9 +30,6 @@ static inline void __hash_init(struct hlist_head
*ht, unsigned int sz)
 /**
  * hash_init - initialize a hash table
  * @table: hashtable to be initialized
- *
- * This has to be a macro since HASH_SIZE() will not work on pointers since
- * it calculates the size during preprocessing.
  */
 #define hash_init(table) __hash_init(table, HASH_SIZE(table))

@@ -58,7 +59,7 @@ static inline void hash_del(struct hlist_node *node)
  */
 #define hash_for_each(table, obj, member)				\
 	for (int _bkt = 0; _bkt < HASH_SIZE(table); _bkt++)		\
-		hlist_for_each_entry(obj, &table[_bkt], member)
+		hlist_for_each_entry(obj, &table[_bkt].hlist, member)

 /**
  * hash_for_each_safe - iterate over a hashtable safe against removal of
@@ -70,7 +71,7 @@ static inline void hash_del(struct hlist_node *node)
  */
 #define hash_for_each_safe(table, obj, tmp, member)			\
 	for (int _bkt = 0; _bkt < HASH_SIZE(table); _bkt++)		\
-		hlist_for_each_entry_safe(obj, tmp, &table[_bkt], member)
+		hlist_for_each_entry_safe(obj, tmp, &table[_bkt].hlist, member)

 /**
  * hash_for_each_possible - iterate over all possible objects hashing to the
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 2b91d16bf14f..27278830de98 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -16,7 +16,7 @@

 #define DEBUG_EXPR	0

-HASHTABLE_DEFINE(expr_hashtable, EXPR_HASHSIZE);
+HASHTABLE_DEFINE(expr_hashtable, EXPR_HASH_BITS);

 static struct expr *expr_eliminate_yn(struct expr *e);

diff --git a/scripts/kconfig/internal.h b/scripts/kconfig/internal.h
index d0ffce2dfbba..dc571d54c18e 100644
--- a/scripts/kconfig/internal.h
+++ b/scripts/kconfig/internal.h
@@ -4,16 +4,16 @@

 #include <hashtable.h>

-#define SYMBOL_HASHSIZE		(1U << 14)
+#define SYMBOL_HASH_BITS	(14)

-extern HASHTABLE_DECLARE(sym_hashtable, SYMBOL_HASHSIZE);
+extern HASHTABLE_DECLARE(sym_hashtable, SYMBOL_HASH_BITS);

 #define for_all_symbols(sym) \
 	hash_for_each(sym_hashtable, sym, node)

-#define EXPR_HASHSIZE		(1U << 14)
+#define EXPR_HASH_BITS		(14)

-extern HASHTABLE_DECLARE(expr_hashtable, EXPR_HASHSIZE);
+extern HASHTABLE_DECLARE(expr_hashtable, EXPR_HASH_BITS);

 void expr_invalidate_all(void);

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 4ced4dd6485b..dec65c0d1181 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -971,7 +971,7 @@ bool sym_is_choice_value(const struct symbol *sym)
 	return !list_empty(&sym->choice_link);
 }

-HASHTABLE_DEFINE(sym_hashtable, SYMBOL_HASHSIZE);
+HASHTABLE_DEFINE(sym_hashtable, SYMBOL_HASH_BITS);

 struct symbol *sym_lookup(const char *name, int flags)
 {
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 0809aa061b6a..80969620d24b 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -14,7 +14,7 @@
 #include "lkc.h"

 /* hash table of all parsed Kconfig files */
-static HASHTABLE_DEFINE(file_hashtable, 1U << 11);
+static HASHTABLE_DEFINE(file_hashtable, 11);

 struct file {
 	struct hlist_node node;
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 75374c64b8cc..87c8044d23f9 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -234,7 +234,7 @@ struct symbol {
 	char name[];
 };

-static HASHTABLE_DEFINE(symbol_hashtable, 1U << 10);
+static HASHTABLE_DEFINE(symbol_hashtable, 10);

 /**
  * Allocate a new symbols for use in the hash of exported symbols or
