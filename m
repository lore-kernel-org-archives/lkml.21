Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307377;
	b=C5LTdIYlEhvnuyQAiLvPL+WojuHdMiQF76CUncED0NdenrznXTFq78iQ4MCIYiRc24iN
	 KzaMgVaxj5NBtftR4J404lPd/NBziGBO9EpkBg3wolaWMttP6CVwYhQ6fZttvm1WJLBBc
	 KzA6Pp98hM4JKJzrWG1LyuaGeeN5pZ+Z43lGypP/hwIe0E62fw3CJCajb+1QUczl0hlBp
	 9AKPrtiPLQtVYfNxy7AVV8DMBcMEM6Q+Ya+gDG0uzhcglUFwxN+CsusTSnbmSKmyLUuqi
	 kk9xTba8oh6dhO6GPTNFwe9U171MDhoQIJOfzra9vpz8w29duz1+WzGAaoD73urohmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/d2B1uiOt5351Wc+V4rdkTylekRqoHBMFthy3xK3VRY=;
	b=YvZlFVGMYpi0g+1NziPGpFYGq5oUTnhQYfS08wynqZqFcrzKw0twHfkDDrJb0hiwTqPh
	 EnZPIl8ZH2Z80Svp+nG004MNSYYu7xe5/HYkQVHHJXRRSSUT3rCRBqR85su73MmZ7xfPR
	 WEg8NSWKMxWkvKQsNHVE1crnQQ2TrwllyvSalSebPwT4GNKZ204gaOWh4O/3zcCch0t9G
	 X+XzUld1PZNJ8HDk5aS4WgClUmyCRWvVmJV1wIK0YpqPq4kxAygpE4k2IAotoiIEFLXlI
	 KHduOpN29m8tNTSYo7PdNki+7VxQ5bpRIBB2gD2tR85/Sf2Exe8xKWeBhOVTqLUyzmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OmEgXWuH;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E864606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E864606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OmEgXWuH
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-921276742e3so20540776d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795307376; x=1795912176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/d2B1uiOt5351Wc+V4rdkTylekRqoHBMFthy3xK3VRY=;
        b=OmEgXWuHrMyeid3mva7NFPaeaTZ0o41DPIZ5dYToRYbdF4PNMVlQF1ZclvQQH35jyG
         ex6PluORcKD7AlEDWofD6cvwuaEfMg0Xi6JEIGBNt2MZ5LmIHdScKFNSDXCJ1IxXqL5k
         EBkc9oVa6UZrp7odi+uskQMDRSBOsx0Z6rmSMeI+fGIICYJ/Z29cqQHbFZyWz5UUVtTC
         +6quiSyEhv8lFwLBvIDMF/PlrYn+3Kj7ZfacxRM0MMAYgEUwySAZvAFCx1yjYcz0ONu6
         NJnHrOAkxW+UokdJv6KphXYETWerAowSpG0YZLBFOOQB3tYmGhui86IoxDjOX0Dz8ciP
         8pFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795307376; x=1795912176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/d2B1uiOt5351Wc+V4rdkTylekRqoHBMFthy3xK3VRY=;
        b=vW9tyZWLggCdVZrv3yeuSKPfhqT9EhIB5hYDN0VtA+d7QQEYCcd/vIKx3eu0KpZ8/l
         +pWwDtZHRPQaIPZT73xb1Lt4+qvYEBGAU2/bwzaQ7Cyl04IbBqBPrJJHDPXP3LSGneAa
         AozgE0fVOujmwMhDf9cO373/P/dXoJUUV7JUvOGqj0VR8Ws9TalXTVrcqJvxScba96SY
         vp51MkWa1QyZOvd2Ra+ojIzO/rkDvwFlIsaijogIW33rbbsD0GDhxXz5RJnKQsHVFamW
         y95oMqtOdEJEkfw33Ndll5LrZypom8291BaSMon5ud9i948TN0qNP+RIwJ71+16ZLOrJ
         SqGg==
X-Forwarded-Encrypted: i=1; AL+hErHFpBfD5C00cU5KMgSxLubfHGSy+MsFvvmLsDWA2wKVN3OrmWi0RIMrBI7I6oCK+23H6b+GnSPxuldQx+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HmAIMj35LR1FNwmIgc86ke4djStBtHEsp6eA0T2NSM5yI+CIM
	f0djJgwABUYN2uBZwazhm2sD5/NfQm7JroV05XxRD8abAGuCiLWI/M8m
X-Gm-Gg: AZFdTZdjcibGa/Gouv+poeiarOSNv44LTeeeHwlQ76CIrtxUidUxbXR232FbKwgugav
	NyA6ZSgHpbcMM+0TxJ2LfZcyMrnAzvbcDZKF/8Bd4WS7q5dlS74Ze/BG2WqkrsDELvLnM/IMSqr
	5N6qBiElulrsIz+0tg5htpplsJnMwn/3TelrP1ScjHts9FheT81rWfD39LcFXcs1hSATqHHwqfL
	SfZt4rSfF6LqwZIMYxAH45yz4oobxYLjsCrfNevPAPaMZcch2ngbQhaqd70/mTBl9KcOT63Q/J0
	6S7PP5kQOPEuiHTc0EjdGBR18Age4EzF2O+WBw1jPB+ukUgqv6tfxA0BdzkRtMdhZkAPtd3wH3d
	mcCfQ8k0wMe7+GDIWqQL72CCEJ+78/I7vVvI4DPTe7q3MByK5goXLWADGvMRiv2V3g0b7prp8N2
	2wQpifWLUb7EAjbokdpLiZUz5h0a7bvRDRc4X45XkubYzryPUMC8KMTYfvLUGh8KA5Mb1W5g9ck
	p2rYiNdKg7YATDIqWyNzZ04oCaTAm9nUtluz1Ufyk1b50KliJAsHXedMsGB7WmMChfDT9ga1fTn
	Qf+Z7AB+rNsy2hyRX40HHEjlulal0HbjwjgOGGpvZaD+j3VpU5Nxcnx73IOehY7gFI1rX8YCOVQ
	ui3LN0Hdve1HY4A/Mpwb5tB2l3YdL
X-Received: by 2002:a05:6214:411c:b0:91e:97a9:cf02 with SMTP id 6a1803df08f44-92134a38ed6mr129326736d6.11.1795307375814;
        Sat, 21 Nov 2026 16:29:35 -0800 (PST)
Received: from localhost.localdomain ([71.18.96.10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a0a454sm64752766d6.35.2026.11.21.16.29.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 16:29:35 -0800 (PST)
From: Yifan Feng <evanfengff@gmail.com>
To: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Yifan Feng <evanfengff@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/damon/core: do not overwrite wmarks.activated in damos_commit()
Date: Sat, 21 Nov 2026 16:29:30 -0800
Message-Id: <20261122002930.98401-1-evanfengff@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damos_commit() copies the whole wmarks struct from the source scheme,
including the private 'activated' field.  The source scheme is a new
one, so the field is always true there.

As a result, a commit turns on a scheme that the watermarks turned off.
If the metric is between mid and high at that time, the scheme keeps
running, though it should stay off until the metric goes below mid.
DAMON_RECLAIM and DAMON_LRU_SORT use the same path for commit_inputs.

Save 'activated' before the copy and restore it after.  Do not restore
it for DAMOS_WMARK_NONE, because nothing sets it again in that case and
the scheme would stay off.

Fixes: 9cb3d0b9dfce ("mm/damon/core: implement DAMON context commit function")
Cc: <stable@vger.kernel.org> # 6.11.x
Signed-off-by: Yifan Feng <evanfengff@gmail.com>
---
Tested in QEMU: without the fix a commit turns the scheme on, with the fix it stays off. kunit and selftests results do not change (13 pass, 2 need drgn).
Found and written with the help of an AI coding assistant.

 mm/damon/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index b8678a53b0a9..9ae77e4d6e57 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -1567,6 +1567,7 @@ static struct damos *damon_nth_scheme(int n, struct damon_ctx *ctx)
 
 static int damos_commit(struct damos *dst, struct damos *src)
 {
+	bool activated = dst->wmarks.activated;
 	int err;
 
 	dst->pattern = src->pattern;
@@ -1578,6 +1579,8 @@ static int damos_commit(struct damos *dst, struct damos *src)
 		return err;
 
 	dst->wmarks = src->wmarks;
+	if (dst->wmarks.metric != DAMOS_WMARK_NONE)
+		dst->wmarks.activated = activated;
 	dst->target_nid = src->target_nid;
 
 	err = damos_commit_dests(&dst->migrate_dests, &src->migrate_dests);

base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
-- 
2.39.3 (Apple Git-146)

