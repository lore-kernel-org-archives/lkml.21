Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795743272;
	b=bAtP4umvFAkxUWjyfmuLxWEFtY6YTQvS5dvmHor+S0jvA30Fr3A+X2iT1OcH2N8yoweK
	 XNRUB90zCCvp7vOK2UXfA9qEkL9FgW385+ATXrV2rBr1qp1j/Hxyr259AiYBSoKubOywE
	 kji1ibC38u0G3gfyDmtWCYliIyhIo6f6M5hgBdNqeifNjRxj4voPqP6kK/K89SiUDlqBM
	 CC83VI7TuQm9VX0d74rLP/SLY61t8OfvH1KWvinIqqxkPpBSxgGboADMVX81c1deZ36HN
	 cXq2hp9Z3PP4nm2T0A+ySUIR4po9nBT8YF1LRNwYlCNBPUjBLWg0ziSZ/isOyl7Hxzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795743272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:Received:From:In-Reply-To:
	 References:MIME-Version:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=l7RO/X9hrpGm7U7ZvUyWBLz5rvKWH6VnYdq6Izp1zz4=;
	b=uIhOAIBd4IA4QnxKUPI2SI96VQ/CaEbFexjl8KBaLbHnTtmCCe6gvRraubEbG/GV/v3p
	 Fk4A1850ara76FDbtx1ZUG99efD3dOLlECllVs98Hcn5dgD/c6flVmOuz3hAjEunaDPti
	 BcnGbFneQo9mNogJMacDiZijUho42AelLlLyklWs6E8hvpxmlwy4DzYx10D4pE1uGKUya
	 RZ6wgfPnMB86s/K9N+NW9LL/Ow5bR7PvaMC0x/J9nu3SbXdxMDELqvT4aVK5LZMNj/db9
	 P/PeUqPvCY8apiL3UytZkIOiTfaRMWVpUNP0q4cVjPz/4B7IvbvZtcB45kbGopn+OOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6288E606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6288E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1362652666b.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795743270; x=1796348070; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7RO/X9hrpGm7U7ZvUyWBLz5rvKWH6VnYdq6Izp1zz4=;
        b=Zzq4TdtQDHxlk2/0GAZfU/sITg0WBdRE7Js2w4zGL9bZzaZK9/HzCNGSTFKiN+NEWG
         Y8Oitwpp2w+96kxE6HA/b+FgPEnRIT0M+3ciT6AFZ6m4Hw8B+BSkciInk3R3Ml1qZtX1
         uEI92xi33BYZ49B5QCQHEp9t48jGgJflte/eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795743270; x=1796348070;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7RO/X9hrpGm7U7ZvUyWBLz5rvKWH6VnYdq6Izp1zz4=;
        b=GZnJm8un8N6CN+nmhZBh6AWGRYy5ansnajlsT1rD1fzhWZQ6xKvXXonq6sMPnkGTRg
         OVWhG573jq/4Q9fOEJ44VocC4M/t0oDsA5DEy9tAZbZj4hFnol38scWvjp6QzIiWEgZG
         xab3WpLJiyoQaKrg4CvYjsy1zAwa9eu7Go6ECpW+3nukbvNScxjzjjdbcVlSb1Yw50N0
         XWIlcmr03NhwDM27LHzjG9Ga8Zq6J4EgcGsUl5vnIsTwm1cW/N/tR+3SDansC7LmYHEG
         zC+6OosB7seS1FpHLoj8s/Xs2lTIqkDAW+9hgaJx+u5I+h1f+ho2eBQRRfa7xxa2kFo9
         Y9zg==
X-Forwarded-Encrypted: i=1; AL+hErHEvHHk3PkmQIpAfzdV7bw0uL4B7cWAwH+0pF5zdyN5FESr6GtIvnFIzEmtk3+wSOqK+ap2Kl54jUd5I7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+57m7WqLK6NpCIMMVno8yKrLMB/3i45FkZVbHsdapclkvfNgFz
	9jVzBdntb4p8FBsGKMraxPAITd3yoWW7O//MsxMBDaYqBh7XDUqtavMJWu3OSnn/dqGrOkjZDW9
	7zldranXE2w==
X-Gm-Gg: AZFdTZfTBAQpA6nkAXqh90IfxTKVIEB1Gh7tO2TBmPbSHXNFaMokXYMVWjKpZEfXK2C
	6eSkAa0iSFWe7gzagrU9Pm24q2BnKCb0qovKqNfDc4KF4UMV1n/Rbr0PSOFqPU5Fa8aH0ateCMe
	NFDaepFvp0YLnyzg44fMTNxJboT9Fs3W7m8CVSw/355noGd+1mmK6ZNW4oq0QPIiveZuOnNS90f
	1TiFBGiRs/f+Jqokgr25NT8AwT6XFzU8KJcutpw4hSK0LZGH/0qbVhvWbrXey6g4ZVqMLHUc3hM
	VdTSF7Q46l957zFFLwmhSB+5dfxb4pvip73ccJJ/fAsf6dO1LCu4oSGH0k42lGElOohXyBalqtO
	uqZE2frGtYG1/P9c48vBoiaKyA+2HwLagsFSkjrVM9pITXUyO7uXV0629liklcu/kIw3PiyDetg
	WGmRrfU2zwcdKbjEvTP+rbMDoP0cBsd8NO2xSeayOdL0XkX0zUkriEsIAqFM09hzLXAaWI+GzlW
	ncJdH0U4u1lM23cQO5VSrL4J8CMcCWPnujXA/5SdUhX8Tskz4yEbgEMscrul4uNZgpZL2xlFSjt
	s42c/FDnxfTSZReXrpJ2l1vi/euoRx2jW76RVY7L48xSeDxQ/mdZoxdEyoTbM4FxH4zmdcOb3wt
	PXRU=
X-Received: by 2002:a17:906:694f:b0:c50:ff1c:22be with SMTP id a640c23a62f3a-c513aace676mr1368884166b.16.1795743269771;
        Thu, 26 Nov 2026 17:34:29 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm843207466b.1.2026.11.26.17.34.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 17:34:29 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1362650666b.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:34:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGz53mEOVGJWHg0M3GUrh+84nn3Jv4juW++0+V7rj/k0VrSwg7CbTV/HRwyuzLkGH26EgowRDmFYM0xZps=@vger.kernel.org
X-Received: by 2002:a17:907:c491:b0:c25:91bc:ff55 with SMTP id
 a640c23a62f3a-c513ab0c6b4mr1782417166b.23.1795743268984; Thu, 26 Nov 2026
 17:34:28 -0800 (PST)
Received: from 425495914135 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Nov 2026 20:34:27 -0500
From: Linus Torvalds <torvalds@linux-foundation.org>
In-Reply-To: <CAHk-=wjcmmgrJy6rknMOTJ76O92QSAMSUaUPKC6N=pASPsxPmA@mail.gmail.com>
References: <20261127000015.3662267-1-julianbraha@gmail.com>
 <20261127000015.3662267-2-julianbraha@gmail.com> <CAHk-=wjcmmgrJy6rknMOTJ76O92QSAMSUaUPKC6N=pASPsxPmA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 20:34:26 -0500
X-Gmail-Original-Message-ID: <CAHk-=wif1CNqxe19O=oCy87TZ_KQoGcoCaOchn-dk11hKoGbOQ@mail.gmail.com>
X-Gm-Features: Aa3M54polP77YZQv9cchX6_j00EPygNp2BPE71doDMsazM4Dd6ppL9CR6_Xn25s
Message-ID: <CAHk-=wif1CNqxe19O=oCy87TZ_KQoGcoCaOchn-dk11hKoGbOQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] scripts: add bit count parameter back to host hash functions
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, samitolvanen@google.com, ljs@kernel.org, 
	david.laight.linux@gmail.com, sashal@kernel.org, lzsx618@gmail.com, 
	zuoan.penguin@gmail.com, petr.pavlu@suse.com, jani.nikula@intel.com, 
	xur@google.com, sidnayyar@google.com, robertusdchris@gmail.com, 
	acourbot@nvidia.com, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Nov 2026 at 17:16, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> NOTE NOTE NOTE! This is untested crap.  It shows the *concept*.  It
> might even work.  But it might also do unspeakable things to your pets.
> Don't trust my word for it.  Look at the code and test it.

Some more testing shows that it needs at least something like this on
top..

With this it *might* actually work.  But when I say "some more testing",
that "some" is still carrying a lot of weight.  Not a lot of, IOW.

I did say it was untested crap.  I guess I'm more of a "high-level
concepts guy" than detail-oriented.

Users? I like to call them "Test subjects" or "Victims".

              Linus

---


diff --git a/scripts/include/hashtable.h b/scripts/include/hashtable.h
index 0d8bb8eb178c..78d63eb96fc4 100644
--- a/scripts/include/hashtable.h
+++ b/scripts/include/hashtable.h
@@ -12,10 +12,14 @@
 	} name

 #define HASHTABLE_DEFINE(name, bits) \
-	HASHTABLE_DECLARE(name, bits) =	{ { [0 ... ((1 << (bits)) - 1)] =
HLIST_HEAD_INIT } }
+	HASHTABLE_DECLARE(name, bits) = { { [0 ... ((1 << (bits)) - 1)] =
HLIST_HEAD_INIT } }
+
+/* Define a table already declared extern with HASHTABLE_DECLARE() */
+#define HASHTABLE_DEFINE_EXTERN(name) \
+	typeof(name) name = { { [0 ... HASH_SIZE(name) - 1] = HLIST_HEAD_INIT } }

 #define HASH_BITS(name) (sizeof((name).hash_bits))
-#define HASH_SIZE(name) (1ul << HASH_BITS(name))
+#define HASH_SIZE(name) ARRAY_SIZE((name).hlist)

 #define hash_head(table, key)	(&(table).hlist[(unsigned)(key) >>
(32-HASH_BITS(table))])

@@ -31,7 +35,7 @@ static inline void __hash_init(struct hlist_head
*ht, unsigned int sz)
  * hash_init - initialize a hash table
  * @table: hashtable to be initialized
  */
-#define hash_init(table) __hash_init(table, HASH_SIZE(table))
+#define hash_init(table) __hash_init((table).hlist, HASH_SIZE(table))

 /**
  * hash_add - add an object to a hashtable
@@ -59,7 +63,7 @@ static inline void hash_del(struct hlist_node *node)
  */
 #define hash_for_each(table, obj, member)				\
 	for (int _bkt = 0; _bkt < HASH_SIZE(table); _bkt++)		\
-		hlist_for_each_entry(obj, &table[_bkt].hlist, member)
+		hlist_for_each_entry(obj, &(table).hlist[_bkt], member)

 /**
  * hash_for_each_safe - iterate over a hashtable safe against removal of
@@ -71,7 +75,7 @@ static inline void hash_del(struct hlist_node *node)
  */
 #define hash_for_each_safe(table, obj, tmp, member)			\
 	for (int _bkt = 0; _bkt < HASH_SIZE(table); _bkt++)		\
-		hlist_for_each_entry_safe(obj, tmp, &table[_bkt].hlist, member)
+		hlist_for_each_entry_safe(obj, tmp, &(table).hlist[_bkt], member)

 /**
  * hash_for_each_possible - iterate over all possible objects hashing to the
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 27278830de98..26b0a64b5cb5 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -16,7 +16,7 @@

 #define DEBUG_EXPR	0

-HASHTABLE_DEFINE(expr_hashtable, EXPR_HASH_BITS);
+HASHTABLE_DEFINE_EXTERN(expr_hashtable);

 static struct expr *expr_eliminate_yn(struct expr *e);

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index dec65c0d1181..2afe2be78a29 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -971,7 +971,7 @@ bool sym_is_choice_value(const struct symbol *sym)
 	return !list_empty(&sym->choice_link);
 }

-HASHTABLE_DEFINE(sym_hashtable, SYMBOL_HASH_BITS);
+HASHTABLE_DEFINE_EXTERN(sym_hashtable);

 struct symbol *sym_lookup(const char *name, int flags)
 {
