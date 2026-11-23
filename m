Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438994;
	b=Uv+NHj6StTXo5SJosCvfC0G3/zW0D6jo2fqMMULzSWpcsyZcYBN3Zb7RuMpc+ARjqQrq
	 gUAMWGe/8yqmFyOSg+QZc5gMOQgMSioSxHdUAhTU0s4V/8+2o4iTHEHkKakQ/JM5PNVj0
	 Qnbv66ZXr9/7j5fcBkh7sKeQ1wTH+qqqJHoOMIQeLm3iV3KpUoJr5EWjnwRMiHusKIXS/
	 ltgZGiF1akKhTiXZFgHsD54pw960suCQ1HBb8xTNsJuESg5Vt4nt1YZ7CzIQZbatY6ACA
	 akYJb+Tdetw2GcfI/qqr97zW8AGCIzswYuekQ+Vql1V3PWlmnofdM+7UFRBSiCmbNhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=eMLemh30tOFWEd3J1uHpw9ECe4OgdCLjsL6KtAJT/rA=;
	b=e3hYThduIIkVM4WMsbo5d/el5cOCTGxrES3dxMXGjqqvxofbr5K7jHys5ls41O2CzMuS
	 9X+z9l0ko6I69XF5/yq+5/iuLhN2SW3PpJfiwKn33GSQFZOsB0qavSDx77JB0Q5DDY415
	 20nC9E+cjQf+Hcs5Kz3v4XTpB5CcQ/dELKEMaAQ+MXoB8FJEIs+pCOABwG/qTljqaPGkc
	 joPdV8RDtPIdTwxapyXgzWteYQ8qHleRJdZhieON1fk8EvBXoAnchFPG6NBluV1NIWzFN
	 DmFwLbnzqV3cyACXbAZz74MRpl3XBAL4dCn6WoobDojz6XvutBj4C7IbRUNY71Xfd5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWlVrON9;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54636606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54636606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWlVrON9
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so31500655e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438993; x=1796043793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eMLemh30tOFWEd3J1uHpw9ECe4OgdCLjsL6KtAJT/rA=;
        b=YWlVrON9qASERTwqASzXJ83ddjWryow6AmpWp02tR9s0vvwgZzRFsjj2BWosJ/tHe9
         5fY2OukDE+mdBKjofdUmWfqK27mTeUn3I0f3Md/1FdvjzTTUVb2eg3PF2xZeVKyUV1hx
         +FAY2LJQuX/NuaGHGDyFh9bkzzIS+yVLwcL7L4BflrdjKWY1yZ77fpkkcrzJNwrsLDZI
         RLUgFEoJRC1oCS5F1+2e553sqT6oAd34kKZNsEpJhP59EkrBTZnFapbh2YpkXHQ7vY0k
         bEY0BzmN+iaTNix3IgslNOOz/T19GmBm1nTHiKnV3vpRXfjIYjGV/RaPWTfzFqNSPdk7
         IuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438993; x=1796043793;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eMLemh30tOFWEd3J1uHpw9ECe4OgdCLjsL6KtAJT/rA=;
        b=PY/uFYAM4WW3IfNhJHPkYvd3Lh0Y7zV4aO/eRoiPcviPeg0lc/XIcoZplqHLvu4t59
         f7+N1ZK0D63oz9UHVMTY6tjAk7AdmSeJVt7DFJOwKqSOFuSXQ99PXUeyTHQ4+KSiZCCI
         reCel8irt3xZoDN/E1DVtrVBdpPf0i8Y7LMNT+O3aQNYXHNEwt5NIMXLR3lnRI6D31pq
         vO+tATMQ08V6QBefVGFpMyREGUYMQ2iuGlNAXJiDSPiDnC5TxyxUXWzXHSZEZXZt+192
         TZs0tkCy8WwlY3uTka7VosAAqzcNJjpgBMuqYGesMJ9rdSOk6H8ULPWE3BunHGN5CVCY
         KNBA==
X-Forwarded-Encrypted: i=1; AL+hErGSsTT1aUaEWkCRTBQlo8JDwLX4YIr+hw9epOCi6OYrCp8N83kf/3iJS9HvBFRwgGSRr+zb7RwCB4m9T1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RMOrZ+imDELbAgxxtycGd/bUCHkFPOAG+kTUQVjOJDmQs/fcY
	cZRWQ6PyCBwD7qlx5vl4I/WtKW02vPChU+4kNLTMifeff9wgOh9kC2iz
X-Gm-Gg: AZFdTZcTUmAiIfqAgnqRShC/OH+HT4lRYFLondcvh9Bl7uSMOAVxRfixkTuQz9eRvgB
	tw2r7onZDtJ20hn7z/CqgMm34S4ORvsuqZZGry9w6OfXSmL/Tw4lb6ELczMpR1/FC/sO/+HC3es
	twenqMODQIf8pocwKtpmtdN10ctU5RSwuyFlYtHj9gZfTMETCl1/0tWTA2AUMFa78QOehQgJ5e0
	q5IRGO8hVVr8zxZLoLIQolGBzcoLd64f4U3N43onABGhJA1oBL2+WzwYW7xTXY/D3/hm6+YBtZe
	N5cOWtR7IqOkQpAVkrYwKtrKwOVRcFlhy3IcW2Tp53An1DUiVKK2RQKGSYkcjSPrshlEfkheOZ2
	JOLwC16LoDGM5vk5GsbZ62Nlvne/7tTwQik+UAE65BhIo6eQUMicKzkh/HBJgwfZQijNFvYhOg+
	Fa/JJxbc4/IFKzYUrofY/Tp0GxQMFtXkcA2lAV8BzYGpltUWAPiCXlEjgdq22EqUvp+ghcDFrv7
	eTcoUS5zPnwrcCj8mJIb/jrnaLVZVz4K+rliPuB4I0kkgv9M9Dps2sRiA390amxY6jEzWhCOElQ
	JHhSgjm/5etTXiZN9NcWaJz3OzbMwwt97g==
X-Received: by 2002:a05:600c:a085:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4bb887ca0dfmr253189505e9.4.1795438992240;
        Mon, 23 Nov 2026 05:03:12 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm310848795e9.12.2026.11.23.05.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:03:11 -0800 (PST)
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
Subject: Re: [PATCH v6 15/43] drm/vkms: Simplify plane_release code
Date: Mon, 23 Nov 2026 13:02:55 +0000
Message-ID: <awQ5FMhggIVxJ4py@ArchOarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-15-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-15-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:57PM +0100, Louis Chauvet wrote:
> plane_release  code used multiple intermediate variable, remove those in
> favor of direct access.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_configfs.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 5f5aa0a1812b..a7ddcfd4e86e 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -331,13 +331,9 @@ static struct configfs_attribute *plane_item_attrs[] = {
>  
>  static void plane_release(struct config_item *item)
>  {
> -	struct vkms_configfs_plane *plane;
> -	struct mutex *lock;
> -
> -	plane = plane_item_to_vkms_configfs_plane(item);
> -	lock = &plane->dev->config->lock;
> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
>  
> -	scoped_guard(mutex, lock) {
> +	scoped_guard(mutex, &plane->dev->config->lock) {
>  		vkms_config_destroy_plane(plane->config);
>  		kfree(plane);
>  	}
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
