Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795234476;
	b=vZ9ocOHckizwTk+ROZEhaWkOuB3cm9AHOvFOj4+BjkKPfxFu1d+5iqyH86P+vAkmzlR9
	 RI30OyA++4wWYsIyGAQQuyZFgyweTfpR/yKaVSdEfmlAPyf+uJQ2bXGLx6Q9ZCerZ2xiy
	 95lTmvpZjQXgjq0Ft8/7rKDhPDtWkibR7vHDDsN8OIUuRW/Lyhx1+qgkWZbKQ7EMziBYP
	 0c0eNc3tq96/866jj6jPe5Lx3n9twO75tzsF9Ky4biUNi7z6CLirrOGGzERnHvmcqzegQ
	 6/2k+bxckRXvegjPDB05nJLSvzR9WOan5GP6UWJt9/GiM4bFvOGFRtuwtTfSr/PubDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795234476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y2KKhwdxNB1TSs7gh9qzf2mf3Ng/63JJG6Lmx8wv1zw=;
	b=2hKYcjzt6HibAd9jmp+zn6o1dkdmsQN/HkgWYPPo3JOFOSjMj+4rE4b/QBlQ89WonAJh
	 jOgFhvd8AL6cg0ai9LespohWAuYj/xEO+aL2EvaB4G2Ap6Za+31ThjRjq/e81svd3rNga
	 HXJz0eF4b3+riw3ECazqhOv5eG5Jr7BhpBVz+a2G6BJgTY9mRdjfbg2Vrj+lGX5JN1/EN
	 1hkGx72vhkpOG4nShsYmMRgFi77ECV5brJhX6/XtlrBccHjCpmRrPc5QuQ7s3/9+CegJu
	 yKcjnHVn+N5JKFlYAU1n/Rb9gkA0YJx4Xlo4VlcCqTThbvEuCkaJHW2tLXFLpriLdBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V8lHnhhq;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C779F606A698
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C779F606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V8lHnhhq
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso3237347c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795234474; x=1795839274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y2KKhwdxNB1TSs7gh9qzf2mf3Ng/63JJG6Lmx8wv1zw=;
        b=V8lHnhhq/FllatE1Z4XG42oeQxCoYk/ATK9Sg3+sNQjAMAamqR1u6MbAt9DsIkJCEk
         JyB2CeXe1qb5nt6z8bBJhEfvce1VbA5PglVW4LZzhQTQgrG4lSANfoB6RfyN6J4MuaGN
         tu51RS7YRK7ZUP0hsfb1kRIch94DakMHg6rxH/GWwq9Rq48yUpAGHeTgSA/5i4G75rs7
         kLsJxuWMuNdL2QmheKnlMkDHJcVSUZh/DS4yoP2Af4rfeq+fIycAaKf6PiHl5b4hyzcf
         0d3WsFHN8Li4B94NVbtJmdO8bmc9gr1wQWDuEpMLRCpWdKZKCKScoCHt67t27whaltqC
         PqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795234474; x=1795839274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y2KKhwdxNB1TSs7gh9qzf2mf3Ng/63JJG6Lmx8wv1zw=;
        b=P4ANpEUhBFW2Pq3Q678ddAGFmqFS60CjBgudh7CbGXhVElALGuhITmn/WiR2VYN+xR
         J+kAy9x824cJJUWPRWmlbtN7lh33zBILmvUDKV+hulY9GjSGmJwMJEKWICHJ8JK4JF4U
         vQ/B91Uknab3nyz5fxlV4b+Jhwsr0thqBw4dNOm3Ol5WBsr95hMZCOp7jbn8AA9/a9bU
         /AWGyibywR2dbUsAicw83vMxq1Td1Ynx44qGRT3nECDqXW9imH6nqgFLtYnrDublFSaR
         geJPno51y+wAVaUYMT9hjJh/sUPtkV/wsVV/G16hFDlrL9rR0ImJvzJE6XUKIM38H4aL
         tqug==
X-Forwarded-Encrypted: i=1; AL+hErFAuPyI6raz0mBjM1gGY+a1r5VEc1X/e/6H9Wt1j8Z2McmYPTAZYZWd2fNRlnK8HGLOj/oWqoH++rEL8ok=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sNs5LrVedMXqQgECes8t9yKsA5JnpZKPQdRV/eH+y+2/CSUNq
	dqmJVjyihErDAfKXl6By6J1qYRxw+N7Oy6zmdO6O0+xoNFRgwz4SCdIe
X-Gm-Gg: AZFdTZdsXYa/oIIpaX35MlGrP1aY2GbPfmdsQ0aANEefDs/vMoHFCnXgTC+z4VS+dc/
	V0pwaN+edyH7JElhKdzSsZg7hUvPlnfRdOLA+v3feuwwFEcn+smR9+gm4jps4HoGMWtmubzc/n8
	ON4zG3mYMd0yQ1vncqtCgQcsctBSiraPE++4GXCcjfr+/XJXFK0q8bZ6NZbDNXtSNusTPnK9xHd
	aZ3D3b6JxUV9kyJRBtSl7Ht05C3xZIACcq6T40/UZeDNeG04tS4iGd1P//0uix1/VEh5mExUQfN
	sbLbwf/6PZ98jDynuluDplmPsiwRHWKCx1Peb0rcsyUd1h8a4Gm3GedtnaOTprGei1MTDtlGgnv
	bG6Jwonuafl6doh6qZTxUWToyodb7fAnb4BxbJRmzGM14qai2LIX8ZrslOvlxEQc3HGbPRjAlNm
	R6J3esA9FC9v/blCtyXNsZ21+hhRdinexazBf8xWs4eb/Ol2Aj9v+LbXSuxPVv8YGqSm5WVvG3A
	yEm11iEo8JTU+kW0a5C1MLIv7utSx4oYVMkFe367A9fvOSPyBgvd475iwI4jCJNG3QyC9s/gpI8
	Nj3VarAec7vD3bbIJAx1
X-Received: by 2002:a05:7022:7f04:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b5566fdfc3mr6201058c88.0.1795234473722;
        Fri, 20 Nov 2026 20:14:33 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm10379603c88.2.2026.11.20.20.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 20:14:33 -0800 (PST)
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
Subject: [PATCH 1/2] drm/amd/display: Document the union in dc_probe_status
Date: Sat, 21 Nov 2026 04:14:26 +0000
Message-ID: <20261121041427.1743954-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran kernel-doc on the file with and without the change.

Fixes: 52771a3254ea ("drm/amd/display: Wire probe commit path into dc_update_state")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
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

base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
-- 
2.53.0

