Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630500;
	b=SbRQ/EzVCklQop9voHpcne6jsiEiGn+r4IoZs+jcBvhIGbpkYeR6SnV9lHXL6acIDMFc
	 UcFyS7pPbrXxZ08yNOGw8ccwWcu7QxNS6Y93GzlMhh/dU4apoMaEziLxXPn8OSL+xSqd6
	 BlbL9zweR25QRDh/xS0nkiQyoMqtrk2OhhMB2lh5AUoYmD40dqExOIiF3TP3D79nhLl4k
	 M3Y7yj1acqHhWBZYu4v3MuTGehISrK5Fhq5N5FIohsWgl7hMgsmfur6XqPR8VhR9W8qCV
	 iH7RTzb07PeYbd8T5Vld6kxLYA+MXtJ3Lkf7bRGqoHaKV9IVrpYxMeRW1swF3JiX/lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OE74N/jLO5L8kW0rYYYkT2JMWRXZNqhc4Q6+JcXJFgw=;
	b=oaSgMV/xX77XryTV3r2yIsJgGLk0k5aKa0MrsUoBbBBuy8wIZXySnoZsQ2cVcXd4hOfN
	 MM2qWxsn7YhBzsYsOFT9FXY+rbKTPSIJ5Gxfz+cWRHoKHvshz7/XKDguxfDbV8x67QbvW
	 rMGrL+09eovJ17GfOm1i9ucS7rpNms/JKpvE9WLxMgLsYw1+xGCB4eLWqkmemxDrQKj7t
	 NhD79Z1pZoKhW6Cm78F3uXuwcjkKz9xv/XvH+WmZkwO+kzAvN2YH+7o2hmJ6ladF4KnaA
	 OAG79LeJ4CIqvC0BCqKawgLa3I1/Tf8jbErdaRFsg/refew8y3f7ugJmvATBOgHxeZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RvJHwPc+;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A05606A688
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A05606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RvJHwPc+
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0d126f631so53922927b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795630497; x=1796235297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OE74N/jLO5L8kW0rYYYkT2JMWRXZNqhc4Q6+JcXJFgw=;
        b=RvJHwPc+GCKu0ylWVa983aWeTWX+6cXVnqfDIDTW3mNKE2Z97Ie6Q+FZzpa7hjz3eA
         gbwHrgikeBeA+KFr3Nh+Km0vaQUPK0R8jz2uFMGL+ctLvwUPFoes44BmlO2wqRoI3SfU
         yhw+IX+O9r1lZ1QHlu6LOdDgNoZ7d6FdOaDXCLw+RYhAL/UXLZzSUO9Cm45BCDs8hQuB
         Uv9MlVJuE8dy4Rx4VoxuNjGnD8NQZp2I3x30xVDQQe+2is1e4dshgRqsLh0/jQeO5d7t
         NNFkYietUWUQH0z0RfPbGl0FAKM+1Epp0ASe6AXhvYABmp7p5WG6doyGjDWZXU4HPqcF
         X6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630497; x=1796235297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OE74N/jLO5L8kW0rYYYkT2JMWRXZNqhc4Q6+JcXJFgw=;
        b=EQXLmJqBJbDsElXgVoF9KAtgFLgF3F4q0zLBgGh4sBIEZ+t5B+M2msSGbxFXqLCIig
         3mVsqE1nDSqVNxVsMhdCZrr2N/foTFQTxyyXWuMzYL8aVNI7GvlhZfnz2fguyMm1gu6f
         A2v+OCcS9LxuZbvfhOKUCdnO2aJh+/PhP2WsQlbrdNyvJvpNwL3rh40minDcFKjar0Sd
         t7WcSW5dX22gw6CuVnQ+NPOVbOizQwPjgH8Sq7/DKqs+g+lHC8BP0Qc9mzf1bA5a4RwS
         r6yUqq//pwUJUNIUoiJmGJ9//0A5Pgi8sZV2g2O4qReqyPkLPFBb/h/TxNkjkcULymCq
         bRBw==
X-Forwarded-Encrypted: i=1; AL+hErGEF5tiYhdUtAUwRB3mQ225CddsTc/Bla2/Gee6zzNtv/XgI8SsvXzrNH+R7wD6BnPF4F2NzVrCbKnSzhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IfYYV/3ADabtd18+3pVUpjqJ6pHiIJjIfv+2NvMgnt6elFBme
	iAyX+mZKX54u4Dg7Y+uilDJ7J+nVEz/ibPJs9CVUijmXg3ZSA8Je7KiPqUT5EWk=
X-Gm-Gg: AZFdTZfq+kO3Qx6kZdMov5NvQ70aixHCTAubAq0eyMvnlsP4eGyxrgUzLkMCbkvwhG4
	DETleIaOzaRbJrrHs+jksAFcGNVJuirwnyy3ZLJwKEMAqZFbiuO9FAz2H2+ncaZM5DIuByWjz1P
	zni2kn9ubXfiIJLkFntjUHnfRGqqf4SO93IZ6kiTFT69HST0vCKQGAxp9BNnyYStjLVLLGDpNVX
	IqOuuYCHRXDqmu7pAvp6aRFdMlJFlCdSfw04oZlumMSZSqaiVw2TcqH9rFkRxi1H2IOIYk2TdM1
	s132gg6CIJwNHiSpotbNn9t9Yl988W/2TUSA0qbB8PfNq3QWVdz4bVodQvXt+yK4sI2YGWbhVIn
	eqU2LasBR6Mf2H4Nqf5Md0U+WwIT3cREtfwso85VhOMtO4VQuBP60sk6uPH2C26jej6a8W3RcLV
	mcW0G3qLEEiHGhDZ8Ec/TNEneaOYBO96bhHKUZk1BEDJfJPUI9ujrlXyoZdU9iZlXF+QfaxJZvE
	Owo07/W+HcsMJ+N8Yi4cF2f+y61fbKllMc9Dru6FvE8D0XGlt4LkCt3aHPEjAEcUpHPeYVlBKVY
	qtt6aGIJLV+nOA==
X-Received: by 2002:a05:690c:4a05:b0:8b4:f721:fd62 with SMTP id 00721157ae682-8b5204e1c88mr74043277b3.48.1795630496886;
        Wed, 25 Nov 2026 10:14:56 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201b8cdbsm74546187b3.1.2026.11.25.10.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:14:56 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/3] tools/nolibc: make atoi() and atol() skip whitespace and accept '+'
Date: Wed, 25 Nov 2026 12:14:53 -0600
Message-ID: <20261125181453.814976-4-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125181453.814976-1-svav2021@gmail.com>
References: <20261125181453.814976-1-svav2021@gmail.com>
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

The C standard defines atoi() and atol() as strtol() with a fixed base
of 10, which skips leading whitespace and accepts an optional '+' or
'-' sign. nolibc only handles '-', so atoi(" 12") and atoi("+5") both
return 0.

Skip leading whitespace, accept '+' and add test cases.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 tools/include/nolibc/stdlib.h                | 5 +++++
 tools/testing/selftests/nolibc/nolibc-test.c | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
index 1c5a914c0f231..cccb8922bde7c 100644
--- a/tools/include/nolibc/stdlib.h
+++ b/tools/include/nolibc/stdlib.h
@@ -66,9 +66,14 @@ long atol(const char *s)
 	unsigned long d;
 	int neg = 0;
 
+	while (isspace(*s))
+		s++;
+
 	if (*s == '-') {
 		neg = 1;
 		s++;
+	} else if (*s == '+') {
+		s++;
 	}
 
 	while (1) {
diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 971a7f48e016d..3062af07304a6 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -2097,6 +2097,12 @@ int run_stdlib(int min, int max)
 		CASE_TEST(limit_ptrdiff_min);       EXPECT_EQ(1, PTRDIFF_MIN, sizeof(long) == 8 ? (ptrdiff_t) 0x8000000000000000LL  : (ptrdiff_t) 0x80000000); break;
 		CASE_TEST(limit_ptrdiff_max);       EXPECT_EQ(1, PTRDIFF_MAX, sizeof(long) == 8 ? (ptrdiff_t) 0x7fffffffffffffffLL  : (ptrdiff_t) 0x7fffffff); break;
 		CASE_TEST(limit_size_max);          EXPECT_EQ(1, SIZE_MAX,    sizeof(long) == 8 ? (size_t)    0xffffffffffffffffULL : (size_t)    0xffffffffU); break;
+		CASE_TEST(atoi_simple);             EXPECT_EQ(1, atoi("35"), 35); break;
+		CASE_TEST(atoi_negative);           EXPECT_EQ(1, atoi("-35"), -35); break;
+		CASE_TEST(atoi_positive);           EXPECT_EQ(1, atoi("+35"), 35); break;
+		CASE_TEST(atoi_space);              EXPECT_EQ(1, atoi(" \t\n35"), 35); break;
+		CASE_TEST(atoi_space_negative);     EXPECT_EQ(1, atoi(" -35"), -35); break;
+		CASE_TEST(atol_space_positive);     EXPECT_EQ(1, atol(" +35"), 35L); break;
 		CASE_TEST(strtol_simple);           EXPECT_STRTOX(1, strtol, "35", 10, 35, -1, 0); break;
 		CASE_TEST(strtol_positive);         EXPECT_STRTOX(1, strtol, "+35", 10, 35, -1, 0); break;
 		CASE_TEST(strtol_negative);         EXPECT_STRTOX(1, strtol, "-35", 10, -35, -1, 0); break;
-- 
2.47.3

