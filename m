Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445788;
	b=UjOK8RLDviu85CzYW8TJlIoW0VM9KqsTOeS95FKrEiu/7a829sShkjKbg34Ks1mJS8A6
	 olPx6t+4xvTIuCo883bc8H0Ap+tVj27R+mHVNyvRaYyag9lt03jA13azp2NCOK2UxYmMc
	 gkHx8JRGX76bvEzGYE4fNo2RxrmV0cGs+M2Nb2DxqLKfX5UTuUOpJ+eHbfH+7vuJzGzWr
	 t9Yknx/5PI8kZiRcx5sdetN0SyDQBTqOymjuE1KV0KfQx+uSLNIbcoDXRgVS03btU4KHU
	 ZF92njJSzz+AnFoRo+8Czx5EW3M2VBHIOaUo6d94KaXsekEoX3NK10UAhf9hbWS1EXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=Q/tJR8V7RQfLEvY5F5nK+jr/e2gzyMXUOQNnz1DPicU=;
	b=COwJrajS7uVAg/+nl9AF9scyqw+6aK7lRjDrwQxXSJkYEP+BbqEBir5F9KRlCNoQ4KPy
	 PTddvTLRW60bMnK0Gex1f9zEV4RKKyOBO6Sfb8s3+1N4nuZu6MG83l3RkiR5jHWidrTBu
	 9accJXn3Kz6CRqcT7v7+i4OWL5pVc+tDIiFfzEgA/gXmSdBYQPmXLDqEDFO4ucwYFETqG
	 WYK9PdTBDpNswILHfhhXECc4/P+8Lpp8SlDamdVGXVZNS9aRdRvcIdaxTdl0Ajmp5afyt
	 cnlKIs9OIJYVQgO/ZIP0QIPyDNT1Or2oiYCLHbsntSh/1ks3EyFEiO4mSq++CRWvLfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bofu6dUO;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386BF606B090
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386BF606B090
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bofu6dUO
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4aa5833c263so3232263f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795445787; x=1796050587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q/tJR8V7RQfLEvY5F5nK+jr/e2gzyMXUOQNnz1DPicU=;
        b=Bofu6dUOLeJhpudTlg6fGStNYoci8efs9cl6wNGmEKJDGeGPhpmvPaFqnwzb5qrhKO
         gePlSwURdD/0CVh3tshh/MITnnFM+tIKSAHqxynv68UtbnbE2HmcqIZVRj6504n72Lpq
         Q+X9Obl/0dbc7/evV7O+ParrfeaxZddPrncgZajAazuEqUdvZhIdFFnQQ1hHX3u8O5Vp
         IahXxjyQpNmLWOzCGOjyPJWGcStkhrg5P9j70XtN4U9jtAO5H+mdupSU5sD7iKdt0Vsr
         1R8CBwEz6sUaqcGBMP2Bs53kyQGibDR3hwLZPyAGci7u3lLdifNsB51JM4RgQBx8cMzA
         59ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445787; x=1796050587;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q/tJR8V7RQfLEvY5F5nK+jr/e2gzyMXUOQNnz1DPicU=;
        b=2mKFsQ7JBqb5TBezNWtqkjC8YdDdAipqKGppMlZvicUs1V7XDZH2oZG4z/rK4OfRWt
         w8tGOj6tOWNiGt0fX/MdooQ/Op95kGQ/rH3QFKzqL69VRdpAYGzn1nrVECErFBV1urY4
         gFngW9n1oYYypwc2bY/I4C5jFFfaMCjGAZpe9WH39vU6xrj4sxPNZBg6V2LHo7Xdf9cP
         mLHZ0u2OuBsgyWpTHNHeZkg1ks+TMj2S3iD5iWzSCSK7j4hwJ4OgRpLtB3ZvR3WRLaxT
         JNXM9C2y5eHbR668J+LKMJ96Oc+cUUuXUJkoByrfiZcD8Xy6Mdw0frLpILts8QYkkdM7
         0IiQ==
X-Forwarded-Encrypted: i=1; AL+hErHNwIc4zRfYspzDBkwwGuf7yWug0o3wqA1bXTeOQJLvx/9LNvF4pPvCUKeww8og6bM9pPs9Tar/X12UKs8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sEB4mYH/ElIRrVU4n0/ToiX+Ce07E38PTaYbur2OgsAUsrD2l
	7MHJsyQLu/uzpFKKdqD0eKF/nQceGj5D+goualQE7sWiRIE8Zf3gygcO
X-Gm-Gg: AZFdTZcikZHFSB301s6yEsvRrfGfY9+WJCUaiBRvcOuAy7IfeRCD62sO6qTel4zboqc
	AU+am254/O2LKGdXLxeG0psM4cXAjCcRDUHdIS4GXJnCAZK6hIjoggaavQodf5+MHddwygesxLr
	iXgaBjcNkbnuQx0aVk0FxMpSQQL9hinbgSrrgPGIuaxhfqQ7ZaRn7O7lpRyEsIfADQ5s9SltIPM
	8/4VY9tNnOQ0J3EViwV2r52KvbprcwaZbR9ExlirrwQt39oT5+ABwIj1oQrU/jzT/d5StqdtooD
	Wtw6lEhdbew6TYgszMlQdVbN175a9sokJFlc75UVaW4ziGA0UApQOW3xTMw8Bdv2h3OmMiDYIE7
	Ny69AJ0UaUfBDrqNX60G6mEX6FhrMLynfFVteWAvH68iHNrZeUmUHhy4Lb4KKYzyJIDw/cJtmAA
	We90nXi3vX8ZVPldewvtwXnN4T9iQGO4ludyYuq0RVA6GHHYYFHxNi8+ob24sn96RSu4Q4TjKVh
	C1kzN999D6CKuT3rwjtt1BH2EDOAxjeN1JNoIcR6IPjH6s5HcBbr9mjfuDLMtYBFVqtNVuLpPfT
	J7jtvc5VZIl8d6x/Ve2EaMmI0k8LkEsHN1jW/pyERlpYHaE0Nx6F2ao=
X-Received: by 2002:adf:e744:0:b0:4aa:2afc:e63c with SMTP id ffacd0b85a97d-4abb400a6bbmr18514149f8f.38.1795445786516;
        Mon, 23 Nov 2026 06:56:26 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm22988840f8f.58.2026.11.23.06.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:56:25 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 18/43] drm/vkms: Introduce config for plane name
Date: Mon, 23 Nov 2026 15:56:06 +0100
Message-ID: <awRQxKxzVyw10pFr@ArchOarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-18-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-18-78ace90f4fc1@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

> @@ -265,7 +266,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  					   &vkms_plane_funcs,
>  					   vkms_formats, ARRAY_SIZE(vkms_formats),
>  					   NULL, vkms_config_plane_get_type(plane_cfg),
> -					   NULL);
> +					   "%s", vkms_config_plane_get_name(plane_cfg));
>  	if (IS_ERR(plane))
>  		return plane;
>

Small one: with no name configured,every plane ends up as "null",so they all look the same in the debugfs listing. Before this patch, the core named: "plane-d", which was pretty handy.

Could we keep that fallback when the name is missing, as it can improve readability? :)



Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>

Thanks,
Oarora Etimis
