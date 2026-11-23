Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436560;
	b=qEFtJxituGZ4lVOIWZ0nuKEyMSZrXcuRtfgxQJRFpD6VSzX4BQy5fSbn0DkHEMtj4tXE
	 an0WXwmAYrVwpFhzgfz/3jLBtw/KIBjLSBo7L2cXE5oEi+J+IblKltm3sJ17N7PA973+a
	 jvbQObYvZQr9w8MWWaDk3n9bWdEpPb8d+3HA+GLnBct4Xun+DeSr3ybt1RCCj6zuOj8r3
	 bRfUD2V0aWbn1naVjutMLaBqFctA2IfuEVVUIK4yMffwlICPc9uzj7zsTZZc3RZ0H6txI
	 qIgK6qKvLYTjOaly3dWuQwDAaLNy/asU6UfkQLIEEwnDiZ/BLNyUm3A5zEBB/jSBgHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=Z2brmbtPSn0eJYb2F1hknHyThriPLBF9yzs2QocOyug=;
	b=uY60zqf+Up5ThDDi3RG853AtYJKUkNo20cty3HCHbtRHW835iNCuNG+XH54VT1HzF4VQ
	 IsFDCV0kyCyCsqNEjfH6njgL42sf76CFNzv/XVab36A9h8NU0p46UidCt0sK7bWNxE0s5
	 Pgtsy9fIKntIxll5M4azOraxLvJe6dWLHMEruGlC8JSWn3vVMVE17uPQVPQuwybKuPt6T
	 WxajJcodoWtQ0uvEKhChD6prhIKi1seeMfI8dPjp1d5+oiE81MLjlL8UjR+aP39dig5zO
	 7KPTe9EeElaRdJeDrsarGWwhrBGCyIq+cyz9oUhnOrl8HYd9g+PSXSKvnA23k59hSQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qvt8c6hi;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0019C606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0019C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qvt8c6hi
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so1832109c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436559; x=1796041359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z2brmbtPSn0eJYb2F1hknHyThriPLBF9yzs2QocOyug=;
        b=Qvt8c6hihidJCuJ1sVwrhX0RFVJdWVuSpRWDc+poAgEmydoQ+be8S4LETfEJGc+T9S
         AfxunBYJfyQHMuVWUg24qcDGiOV2mIQbrvq37ticLQ9HiLBFScubJoZMRd1Wg1/+H8NA
         RH+FeBPm5zSYDTqMY3DcJLp46uMbPJgw9WfaIOpCgTO+r5JC2mrLUG2OyX+brwLCiDZp
         2eJ063qXBxiDK67RsDE95mHk0IT26GBoi+FxU1vkpDB2lNAHZ8Lb2gsKy40KhOLREdur
         Yzfb0/SeI0GnqUKAGbMw4Gmq0lz8LacqDO+FUXrJ3pFLJiVl9+8kS5V7MAKYeG/eLVbH
         2i0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436559; x=1796041359;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2brmbtPSn0eJYb2F1hknHyThriPLBF9yzs2QocOyug=;
        b=q8l+ManMmDvLiWisg8WU8i+0yqIH5pVihYyf0KhDxzSSvT7/qXwbYnmL+IwZGyS+yV
         HWSNtg+ul5nL1IG12oJA4KGRXo29Ds1oODQR7ZFv34NhqwA6zzdOigdwWLlVJ/d9DMhY
         ImOs3F3v7eGlT1JtuDaGLo1Il9nrDT1vSLjvMyog6rX3vWyQlgQDrnmxucPYlej9WQ05
         4LR+QrGdTupBgrQ8ZvrGhaeKoabUe7TNqWhKvZBlG0/qxGiOMJvpVIx/hWBZTiEKUr/g
         R5Voesa/dpeXyhdHDulaMZ29p0zG6SjWAzmhYeUP36zPAJWifbiuWvDSUMMev91vy3r3
         kKhQ==
X-Forwarded-Encrypted: i=1; AL+hErEEVMeQmscn2tNAEWTwNJsrgI8ZDjFK6Tz55M+GWvwv7FMPinJN7ea4jqbHUTVrs42cVUsDlRPYwTTS1GA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uSbI51/zldMgBWYqN5syX8AFmQqbCJuk5QmOKDvEnFhyaCZzx
	ePqemwHCNj9KqlhLMKQUFKtCEXyTG9NOkF+vua64xbWgOdO5Myz+CafL
X-Gm-Gg: AZFdTZejAyr27dHhfkalWjKXdfJwni6khccug+t01hnC/L0wgeNRRTYeRUSo+RDAhYD
	voXMHozpV9QTMi/dccmhDmSslFjuDEMYzoEevSu3TYQ/xY9iFjwBtMEnwccLUMYqX5n1kfcrwLM
	jWj8C8HPV5jBjlf0uqljpmAZTnCJJWo1sPpDMhyMdHUxSXFYmvcHnZVS6XOTaQYJulXcc/h2ney
	V9otOQWoLVpngGdYmPLljcJpbpxFhtXEUwIW7Vqh/Z9MgnsnbRU3EmkuCOFIEAG6YcGUK4foEZH
	+aNtvDyG+5vD+kQ7668UaAECW/r1NqITvcw/0H8cXCkR/Y4LuBIXsEGgOf8gXYBasHd1vdQwX4L
	yg87+m8OEiumKy7mp4l9xfsYoq1u2S64mhiA6d6bZH6pk4LdBCCSA9+D46zO6HO7f5j23JZZtX6
	XySOFHYf582sVkcuvfjq7Dsg5pNoMjm4tShlQoPxCgxvj9Rl4woo0CV18eXEYERKRDQgRoVMQSB
	qDK/sKnmYJ7d5svde3ibUW55vAL4323Y8D44MvgFehfDofzSJVPHuv2r/9cuZz7y+uxMsnpKUvq
	1p5k+1UzewE5kRdvBz14OvEKEg==
X-Received: by 2002:a05:701b:450f:10b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1b56f87ae87mr4215314c88.27.1795436558585;
        Mon, 23 Nov 2026 04:22:38 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm27463157c88.2.2026.11.23.04.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:22:38 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Weijie Yuan <wy@wyuan.org>
Cc: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Thomas Huth <thuth@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, TAKANO Mitsuhiro <takano32@gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Document the union in dc_probe_status
Date: Mon, 23 Nov 2026 12:22:35 +0000
Message-ID: <179543655559.4100066.12937692101747026786@gmail.com>
In-Reply-To: <awO-665NEGdZtq1z@wyuan.org>
References: <20261121041427.1743954-1-takano32@gmail.com> <awO-665NEGdZtq1z@wyuan.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py

Hi Weijie,

Thanks.  Moved the AI disclosure below the --- in each patch, so it stays out
of the commit message, and put it in the cover letter too.  Re-sent as v2, in
a new thread ("[PATCH v2 0/2] drm/amd/display: document two members of dc.h");
the diff is unchanged.

TAKANO

