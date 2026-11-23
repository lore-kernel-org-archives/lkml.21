Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436553;
	b=JM/xzL5d4qkf0aKiI6Wi759Kewg7Kg3SdtlNJzNYPLUS4CVYUogEZT8xjdBL++2rGjD7
	 HrfV0mXC+F/G7ROaQujnpGT1s6+NxqF06EFhjpECru80gkN3nHMKloRR2aeXAEmcfYhcT
	 e/Wja04FaHFv88+tyYl3AMFg9XaGKEj6fBCm1Cf28d06VbxlSRx63cTCzQp7HII5Yfo8l
	 iO4h3Vaz57vl7709oE/SFuThtMDOFw1zggwCCRyWvACbGRMf3DccywjR4d4fy2twzg3aq
	 r7XOXXkzi2bg2kLZ+S2sSTETb2z/RsST/j5rRDafuSeaNX6F5MhQjOCU4+Fk3KW4zPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VkpezA87wsH4BygJMCDh1GwoGufvYHw4wQvZr1AYzhM=;
	b=NM1LOQuXNTcoMpmInBN0ELdVlm5+s9HzU8Iu8icAM/HQcS9+qSwndjym0rgmhr8IozWD
	 +wRGJnNsjhWhYq39o0XnxAlsl10dacWBV2HWfgDHfRNWyRYLnj9IgGUM1JJUlVrkLSovA
	 cKK+uu6MmMdum4bUIdx07xBvYEarSX3xvUy9+yccv1gDVFphL/X0x0wdGWB//wI+RC1QZ
	 WXShaBwQBcbFqyOPUrjqW7MukgWBmYlo3uOuv4oWz5dlhGasqvF4rM7oCG9N6u/ZLVcK2
	 KvBXBfPv2sqcZlB8C1SvSuNo74JyY5Y0yFvRUlXDXwgFb6THwgAQQgW8J1NOYOn0T+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MDn/0Tl+";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8A1606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B8A1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDn/0Tl+
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3282db206d3so9651053eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436552; x=1796041352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkpezA87wsH4BygJMCDh1GwoGufvYHw4wQvZr1AYzhM=;
        b=MDn/0Tl+QhrKPmfA6s+IURtqGqSKqIqksYxNETc7n9ZBQXeGtUBDvFkW3Cao3J06NU
         xLQLAzMpy7jBIx1FEKoaDJG9Rx+qU5HPW9Mb+rS/tv5h9DVYet0SO2Xdb6ZHMgOouVFr
         DkFHxkBBu4ChAzoQ9A0j4E+76ajsRLe/ZA2ETqlGPqHKZQazKbuW61qaenEx+fAGY2Gu
         l1kcLQTPq+0ZX/fo/RNapJJ45cd6XUmFE/vfFNvA5X3i0eEMntXfglgy+qpce7FkhD3T
         HnKW8LbfFYUosN8YuIgTP9v7sD5ITMyKruSB4ZT5+HBQlzUJDrrFTypWHJBwkui+VXcv
         Xjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436552; x=1796041352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkpezA87wsH4BygJMCDh1GwoGufvYHw4wQvZr1AYzhM=;
        b=H3vKSn1DEYXcJ4JTsDbjWVDg6CvSuXMieeZmAvfIb4/WrTMlItZjzCHyYjgERuTNqS
         UTUh+4RPMDtGr4GHK3kB3PgQDAY5fKNi1K2SHYJkTvF7HP+nrHLeooqJiUqmFGOAl+fS
         XW3urtPzPdaS1H4lVz2Vz/kV/PML9Zbt6EesDbmuhv0yLk3yyiVRlmiMeLLz1O+7Mr+n
         kDp2EgyraaDLPxy0iWBifCtMhkdGROxAtCZPOvpITxp8JybTE2fJ8cWT/GzqhZNYWX7+
         UFfigc4Fn8Y58ttZv/0fFBM5e1z72mK+Lnjdk6T6D282v2xQxAEf8v3H3tVR5aH/rsb0
         rDvg==
X-Forwarded-Encrypted: i=1; AL+hErHNfHyE4U8hDyh2woI7vGvULRed/8UHzLAfiDF2xBEoPXh0ralA1H5mUXNERpH2fbyRKKHw9TFWNaH8m2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NoA/xytXj5T2srTbW2mpuWEU4nIapd+zh4BsRZ5vUrBUKHgXF
	DfGpIa2UzSrVE9ybWM752YQ1k2oNlecZ3abgqOtAFfeqAjvWE3Fw+p2Q
X-Gm-Gg: AZFdTZeUMqrf2tbKn8ULkv/pJZL5mAQrKfpcYuk+OhEwGzTHdBiocmPRulai+fbKltH
	StaqvkR4fkb2+PGdlxlvTevWd8oogdjUkTrJ4Rvjeq/thJuITkOGGnQ1EDIIYEcMPRV5CIp6EW9
	FSF2UjPClk5x92ZSiHEJuURpzPP8wlihBq70xlEwkIRp8pUufb78axLWPY0oS6GKfD5y6Xd7y8J
	tzMsQdBrbN9dxTHJswSZ+gn14q8XQjkXb6CXb4zv+1KR0U3sfSF+ug+tpGKnQRY5ONnB0HjMjSW
	Jg+JwkgmgwB6Zq3x49ib5Lf0zEwXJixMH1GaNLHdZ055pdaKrG7pg2SsVF0hvoTrgqXLUepLMpe
	Up79Yirepth3DCDcObF0cyrTcJNfngDWG+BkZytRgnGukzi/tZYK8AfWQa7Cm/wlleC/wyGbzit
	bSI+Mv3S0nkxm4dRgWRLlWPwPNyQo5tdmAJB0T1aa+p/tc037NXGf1KhRaw/7FVkmfBSRsKgZa2
	YfIskED7tcrw3Y2qZqTuQ1gXo/jV+pRjHo0whMUOKXPhiAiojvixmfw2BEteuxVXKiPeS/rrcUB
	DKklwiEisGVCZ/BC2kwO
X-Received: by 2002:a05:693c:8083:b0:377:678:2309 with SMTP id 5a478bee46e88-3856ef47a98mr12431705eec.15.1795436552292;
        Mon, 23 Nov 2026 04:22:32 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm25173398eec.1.2026.11.23.04.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:22:31 -0800 (PST)
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
Date: Mon, 23 Nov 2026 12:22:25 +0000
Message-ID: <20261123122226.4101191-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123122226.4101191-1-takano32@gmail.com>
References: <20261123122226.4101191-1-takano32@gmail.com>
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
v2: the AI disclosure moved out of the commit message, as Weijie Yuan
suggested; no change to the diff.

Written with Hermes Agent, an LLM assistant; I reviewed it and ran kernel-doc
on the file before and after the change.

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
-- 
2.53.0

