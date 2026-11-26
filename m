Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656201;
	b=mkiUCzhCVvSECYyQQ7xzTg8Nn0cSOQrvoJ1/CADq8R+mUMO77vtEWw6vTdp93gP9oKYd
	 7OAKnK2zNOgnjQQUnXkBxSRfBUJUQpRdhlFjdcYkfC3m9f0y0XQhdHsudG9zbocddrEz1
	 f1W5rb75uBI9RmLsyXNE/xovlM994ln+OA2rgdBy9vi5ZTQbZ/FVfVVn1azBHeIUIgmBd
	 U3pa/dOlK64sMUa2WQLAXdYSLEFjTefOGfpk+RAHFGZEO2/vj0x3VMEeQfSvb0uSBNj5i
	 X9VVbfoftVMCDGEDllVIUKeE/fTSzk7crnpeOLg2VeEiEp3yDMUOE4JM8Ej4va6zv5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6Urp5/OJ9NylMBAWTCtZAf0CBN7LWkjVlT2t9qwaMlY=;
	b=TRXUN1J1FKSDjty+VgXFQ5NvAQ6gZS66tMZziRFbjAHkuY4dOfc1EfptjMt93hvBoLJN
	 cT3MSMU/72NtS+6i1PUZo1kt9hjnoHty640mcswQaEBl7SDFEeXRfgAipwAmoamMlDl7n
	 lRcjZe24Vy8QU5mCo0fXe543rXhavD+Dp2Ic9xbK99VIZ+0ylqoTckDmVW4Jwz/81qehU
	 8/LPOvRF/QlZbrPp592Vd5dcPkuHgQbNHFCYvzt5Hnt1HuqVtW6zZM5WqmIY7YC1pMtt0
	 RaZpb09c823j4mZfFgYNwkTwEo8D20Qhahig4IkB/8K9+hE7X6FdjtvR74ZfWbrmsAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mdW85UUi;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D28A606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D28A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mdW85UUi
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386bd881d39so5864562eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795656200; x=1796261000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Urp5/OJ9NylMBAWTCtZAf0CBN7LWkjVlT2t9qwaMlY=;
        b=mdW85UUiSbs1KnEQL7oArhWWjW43k+SxuQtLmD87WulIQSSb/sTT+Q83Pu1zwTuDPh
         q29eUCHsFUsP7QmN0GoxuSU51kpVYTRincnq8h0Jrcugjd7utBF8TGqFQm2cscsFOrXd
         eJTH8Mzuo0t7qXnrjm3f51vr0SnmKlrsfCiHoE7Ze0MFaD1AQLLEhms5uT3M1AGyN+kw
         awt6jDUl1/8AH5zpXTS9N19sAdmodne2X/0JKaArnbdy9x5uqhB7FhH62O4XkpuMkjIi
         AaKh9nN87NgotnOgLvs00QdcQVIEs2bR2RzR7FWlxYWPvPfCh0OgwHEIv7Ppen3Lo3kX
         STUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795656200; x=1796261000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Urp5/OJ9NylMBAWTCtZAf0CBN7LWkjVlT2t9qwaMlY=;
        b=Zj883oIT+DD+7Asv9+OjvjTBJ8Hv8LEGj6LmHkj/EGkcWN6T3g7e7GOMXACtrdZJTQ
         omEWFenAiZfkNdoV9yF1mGDGWSqjTkYo0W3RDd6z+D5arSuyLxw2osB1SB1sqAlXftJO
         jT6pHMCenxeWCIcFHs2m5rYzwhfLZAc7sS7ci8ScRusH9lQEeY3MRhiMrT5BnqK8gRu0
         kdwqFt80gU/ireDQJqJTQvHR7NZxjedOTebUg3NqxRAhS3UTZ8kE5oc1ZKY6YMAjpt45
         0UuBSDrmT0RCTbI05yQS5J3TZ3db5nALcygFeXl2vCE3HvJTK0AOxTgLvp6GAQ5+az+C
         zHUw==
X-Forwarded-Encrypted: i=1; AL+hErF0Z7OQHYOLe64GK35nPEDLBWm2VoPCDjvEB/7dJzln0GQqM8Lp40I8COfDLqb8lykGuQYTj7zTyU9mjqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iOpwn4t6KSV+o9POmGvjBbAzDEWXs32p3i5UsAkTAVOkPLBxe
	to4X/optMo0xSzr7f4z+4MTkByI98M8aAW4EYEku9+voEKH3aC5tw0Q/
X-Gm-Gg: AZFdTZfiNS5wiHgDcY5PBpgxV8szoIZrrgW7PUaG3TaIuh2fZKPbfBm8RBOnsGaJA5B
	MSj8L0/uPJBnLiNLct3aaYLx3i0TkaMUbgDjqVO8AHTeIkOcCeAGhfH9eWJPZ5tVrKkxgM7+K+j
	3YJ/bkDvVlHSkWH4dBtEvH8ldMHkBHeHA8TKqWV2ad1mj2PFA3D2JpOuOnCSmPrnykk5i6qsSSP
	lRI3ZNyPcYb4vdVPzV+eUkeqQH3/8tZf+nZhEtCZVDdSWttb9PcVrCQG7hYE2MklFJSPKBusHkj
	fcmjc6tUfb2pr28g1bZ0dgxNj9UnZAy4TemLI37xXPhj5MB4NXPPNFSoZyiuuXeHha2mlBQr5ZO
	qB1pkkOZqcuYP5nl0O9FzRILO6X5ld6K+JyB7V6DbJHxa7o4//yoQhIwSKLgiym7KRhXLjn7x73
	C9OuoZ+f0eLVQvKoK7PsRV8DyPGRpq3YxjFovLAdwbX0C40jZsjfnyvleLcyFcFNHYJlvBDou2p
	DRHhLNqpPBFnhfZBK98UFy/ztsN6Hku+H3vCMI1gFB9u6wep3wHJnNz1x2bgS/I+BoslX2E+isy
	4oEX0kuHR5PEBRTKeCByUovPK+JYoTz+3NFokl4yKw==
X-Received: by 2002:a05:7300:c00f:10b0:36c:a321:9fbc with SMTP id 5a478bee46e88-3856c9a6858mr22818091eec.1.1795656200044;
        Wed, 25 Nov 2026 17:23:20 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm59360148eec.12.2026.11.25.17.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:23:19 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Huth <thuth@redhat.com>,
	Weijie Yuan <wy@wyuan.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 1/2] drm/amd/display: Document the union in dc_probe_status
Date: Thu, 26 Nov 2026 01:23:15 +0000
Message-ID: <20261126012316.2624853-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121041427.1743954-1-takano32@gmail.com>
References: <20261121041427.1743954-1-takano32@gmail.com>
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

The members of the union in dc_probe_status are described one by one as
@u.bandwidth_mbps and so on, but the union itself has no description, so
kernel-doc reports:

  dc.h:2225 struct member 'u' not described in
  'dc_probe_status'

Describe it, saying that the member holding the result depends on the
probe type.

Fixes: 52771a3254ea ("drm/amd/display: Wire probe commit path into dc_update_state")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: The disclosure moves below the --- line, where Weijie Yuan asked for
    it; the commit message keeps the change alone.  The patches are
    unchanged otherwise, so the diff is the one already posted.

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran kernel-doc on the file with and without the change.

 drivers/gpu/drm/amd/display/dc/dc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index d3c484f45333..debdd69bbe4e 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -2207,6 +2207,7 @@ struct dc_probe_latencies {
  * @valid: true if a measurement was latched.
  * @measuring: true if the hardware counter is currently running.
  * @type: type of the probe that produced this result.
+ * @u: probe result; the member holding it depends on @type.
  * @u.bandwidth_mbps:         peak BW in Mbps (DC_PROBE_PEAK_MEM_BW).
  * @u.latency:                min/max/avg memory latency in ns (DC_PROBE_MEM_LATENCY),
  *                            stored as struct dc_probe_latencies.

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

