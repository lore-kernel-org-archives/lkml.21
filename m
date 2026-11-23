Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436555;
	b=mkQ+KLReQP148/kkJOxAL7aHEmWCxAE8TZdkNWNjR1L3CZVjrTjC5zCSrBdApibMZPl5
	 togGSVJUJRszMSfEPMhElXjKwsfnnUzfEpI1ImwQ9Wqb8mD1nS7RRKZAz6Z9ZHdYrkwZA
	 lcijBIixFgejudtSJwfe27kitjclcMFZez6HXQir44ZRWJMXTOdblvV2TXa8ADmitnW1p
	 yZMYy4ayizqob2UEiba4ZDAWLRde4deRl/yRxAFc7wVktNXpa5IjI9+ogPEnsz1RcMIMB
	 CfOlHv2uQ7TqNFRIwwQLv2rIDvvZWYTxBxZAibcmAQXWYvNEUxRqXSOTXgBnrhcVmag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AX461gI0Jcb9WgcGuMUkXzkqs9S5oOCBlxxBvQFHCBk=;
	b=NXumEj1KVCf6Mi0a/6rdJCtchCwvu9UKKN/MhL5XJeZlTSJ6lgQcR0vSDPC7pGln7seU
	 WYeKHeN064Y1TVVfnovaZyYiQkzQLSeBh2l3+BeD32v3UQJi4EADJBRD1WnoBv4RCJ2dn
	 2NGvZbBK1wv9s7Er6AZC5YGMe5waIGi/ZkUanFnkcNxhQNVdatlppjaYv9Gbsw1V/hXyM
	 tJO2OO2FBHvQPsjPOYLjv+wLmQIIkPxhZB5rjLafXqdHPpK0DU/I0d0FehfIJ9z1cnlwF
	 gIwDn2a38lrhl7+IGx3KppW8HtDbJcLIYU8ykrNQ62zT+E2UgdMPzurXp2dX0OLCYlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yyXxVDly;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B035606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B035606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yyXxVDly
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38190551625so6695423eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436555; x=1796041355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AX461gI0Jcb9WgcGuMUkXzkqs9S5oOCBlxxBvQFHCBk=;
        b=yyXxVDlyor0QS8GBfOVuci1BpsSMChtQ4oItTFM7iGWSHCcSxq5CrNHyX00vZ/2izP
         WjkGu+vpvvLunL8ZWN4yy1ebZ61QQ/RZ2ADs6rngikagVBnnIKwuWx6iGcBly3rz7exw
         dX4yUnPyiJUOaL4rP/8sBFMQfL5TFfGXTG9YyvuDekfk/wtfLjYO1fFKTp72RyeR3lzs
         GAISo/8MJprymwhtMb14tJHFRjHdeF8ohdShjhuFRyY1fK94oWgtNWenbszV9azLtb8g
         B43x/Y5CicuU7gRq3F/2qEJnZ56HGzZ32HGKG3Xm/srplkzV2E4+f3SjaPXR490zKGAD
         cBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436555; x=1796041355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AX461gI0Jcb9WgcGuMUkXzkqs9S5oOCBlxxBvQFHCBk=;
        b=T9tt2s89X1384vnhC/hVPfO1yo7YzpiHB7vo2F1jg9pnZtMG6+vjHTwdBgS3rNCLZ/
         Y0vLTHJm/QFc/jUzwGWRy2hTMNhhq5C/64OodJ2cIyjMWzCByc2pK12AvjbSdmNufPNM
         8B6bKhpYf4IHhowrjXpSbP3IijllLF2fDVUMey6g1I2nDLCfhkyHpx6EJ/V8bJLexPJF
         SXh0gTLtHbC/Pef5fzpuzzzVXt+FRasgzlNGN3f3cEjRgVqPdGsafUXHm4BXd2orwA76
         +gVVv8/HIveDiFDQqpUaPJV6cHbUis5GmG4Tf6ogZxhfDxmz3ZVWRtfHI1Qa5RVyZq/V
         NFuQ==
X-Forwarded-Encrypted: i=1; AL+hErHfMyKc++T0aKm3T+S8P5o+S3x62f4B5+Z2Tmr2cQ1/uzpYFk1hBj/4zaPQad6T0VoC6tC17HXCtwQLOuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U6Xs+CANeM6knUmHLEpecr2nDUWyoES+cesJRBfu1Am4yM7B1
	ge4OYPJ1/UrbG/7Lj52HUqcbbYCRFIf3hOHL/o8STCuQ2UzquKF4ESub
X-Gm-Gg: AZFdTZfRY7e5pp5dFyL6hbEF98Rz39HlDKMv4sAJcImfGBoUczlVFBnmVQmmjByohYf
	AgKyEXXm3VS9/zcLxm5Tlqte/CauXTDctu2eky/ARzYJrltzulnFOLzUUmVV3v88mTG27v9ozgO
	YfgJqtSQPUzSkge4tFsyEiV4Kir/BY+OmG+FDrTlF+ybl98xmSssdmH0uGRg9m9UJJhx55ucqnH
	xOFfVncR4eoPYXzQ29zhTi563HI2PHkCYh753OwjOnNrZMVDQsN719q+N/SMCFanId5sxEHLiri
	VpUiV5bVPJiOry1I4hjdjkVu5I+5Z4PulY2eEbXywa/1HXDlLCcIMuv1/EitnmWpriz5a2WZewX
	Jya3Pig3ljMwTTBRyPqdAUXh7YbG5Duj/ipdQ0PmkXfLjdLzlLkHhEr3WsTPaWMHQd81n7TPCJ5
	lQE2TQqanaMI7s8WW828PuVH3YPxRC9Tcx1pJRtfW8jJmUMaoAFVhOAdSs4hNQGqZrOElLDMASk
	McpM7vEZXpiB7CGT4kuAC1WW+dQc4QxHU/3IFabOW1ht3JqcUxvPDiivHwR9gF7VXRUdyOFtsIS
	RCrbjGRGWCoOKiPBTiGk
X-Received: by 2002:a05:693c:42cb:b0:386:b621:d8ec with SMTP id 5a478bee46e88-386b621dc16mr1579202eec.19.1795436554617;
        Mon, 23 Nov 2026 04:22:34 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm25173398eec.1.2026.11.23.04.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:22:34 -0800 (PST)
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
Subject: [PATCH v2 2/2] drm/amd/display: Document max_gamut_remap_coeff
Date: Mon, 23 Nov 2026 12:22:26 +0000
Message-ID: <20261123122226.4101191-3-takano32@gmail.com>
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

kernel-doc reports:

  dc.h:329 struct member 'max_gamut_remap_coeff' not described in
  'mpc_color_caps'

The 17 resource files that set dc->caps.color.mpc.gamut_remap to 1 also
set the member to dc_fixpt_from_fraction(S3D12_MAX, DIVIDER); the other
ten leave it at zero, and the comment of mpc_color_caps does not mention
it.  Describe it.

Fixes: 1c5e6cd8291f ("drm/amd/display: adjust floating point format for gamut remap when needed")
Link: https://lore.kernel.org/all/ec4d7cff-d23a-46d1-b245-921f442b9a7b@redhat.com/
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: the AI disclosure moved out of the commit message, as Weijie Yuan
suggested; no change to the diff.

Written with Hermes Agent, an LLM assistant; I reviewed it and ran kernel-doc
on the file before and after the change.

 drivers/gpu/drm/amd/display/dc/dc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index debdd69bbe4e..32bf87fed40d 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -314,6 +314,7 @@ struct lut3d_caps {
  * @mcm_3d_lut_caps: HW support cap for MCM LUT memory
  * @rmcm_3d_lut_caps: HW support cap for RMCM LUT memory
  * @preblend: whether color manager supports preblend with MPC
+ * @max_gamut_remap_coeff: largest gamut remap coefficient the MPC supports
  */
 struct mpc_color_caps {
 	uint16_t gamut_remap : 1;
-- 
2.53.0

