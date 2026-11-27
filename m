Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776018;
	b=sTCMzug5J4wtCoDKgJBXim6hL+PDEywKhPIo7H95O6HLtjd8kJpgEitOU1T7fFdO3yQx
	 c4oTYTVt63Qpi2AIVZpIwH0ivQBQnPVc5fbuxhHsnjJOBP7u8pE9+aKM50P+EpJyXSTpn
	 2ELDCtE0emQOR8DIb4LAttJnvjTb4SPAkpBgSUzwTOprKj1nJJZ2VcXciTUJqP70Nv4mA
	 2dDnMkwkgxNmclJQ+DGINmmn69hDwVy0uywAdmc31YGMmZY/qNiHO9R+9cN+dtZ8+F8aX
	 mTjjda8sHIku4EXa+vfdkTxQ9FpE3UbMN3u2KNE4NhPJiAijT+L9pDCrEeXwKlFdZZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=1AjK2nvlqvf8IJCDZeqJhDHtg4Ek4fFwEyf2Q1hpYQA=;
	b=p5H1SEnWTNaGahvee7zpUrHNZnGeCU7wqeDxzzumscUSO63RQD+bDVRlNQaKedLHlYv/
	 ZlAETdu/fsc8OrPqpYxaBwH8RWW3w0CWNSesEGKF+PgNHcYF56vfrMDyKDmx4876jBMTG
	 3I3x+EKw8Uw5lRO++r5eKmMRh7BiVTv13ZuzVLxhEA9WlqtrxBJHthFegMH37ldz/cIeJ
	 bMXtYY+HTxve06dD4RyWIJ4n4HhqVUknj9YbhD/cB/oNSgYBtbJ0Ij/MQ9yKKQsdeUfkc
	 WrnxsTwbdzohYahuH1UO3ba7+v8HFoeYYhiDT2VotsTjKPQw6q/EIe/KMIEMgSHhuCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uVJJcr7e;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2338F606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2338F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uVJJcr7e
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4647139f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795776016; x=1796380816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AjK2nvlqvf8IJCDZeqJhDHtg4Ek4fFwEyf2Q1hpYQA=;
        b=uVJJcr7enYHb7QW0rIHvPMSQildPszsaUSPXO3RI/alO6ZX+tsFbU1Mj46g3n4n7Ga
         mYYeS03YNTJrtg7VNmFl0QFjxZnyYmjb4JHPE7qMMYfjMXRMfnQplW4qEo1E5Hu2xNhR
         oAFO6Bfr72CZ6PeE7INPejVMeqqwpje9TWokX/AGhw/ldNSi7lPOQLtpav12D+kq2AT9
         IAzNpYhjj7QPJQy5tnI8aGL/Yb2VoGX86lSHCKSjJX5LdLqFxc3Qgtcy93AAwrOCKqoP
         7kkGpaQ9PpI64wmDHptaWxe2mEUD2YX96YHDDiaAahT/++rZmGMeI1F9wgppqI1HeSOZ
         DbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776016; x=1796380816;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1AjK2nvlqvf8IJCDZeqJhDHtg4Ek4fFwEyf2Q1hpYQA=;
        b=1+CgFOwUyWTZ8Jcgl0BQrUrQDzCYf8f/jkhQ/CbjHJ50B5lkNkpUDzrTpTGsvi8meT
         21XfKnAaJx/wyPuMRhsdBGYjBfJhPqwl/IjgfmeQ8J5XUTfNJdFnTESwxHvBUocJoW2E
         QiAPq+ZNCNStBVkJv1H12MtwBnDO4mVFTMyL7hQ+DOwk3oLwx0ZmnwZwIZjl9+46p5YW
         nzbPQp6o19fBv5/EiU88jvAlzjQw1IHiSzfeDLprRHbo3JD+3FC3MhFJbgW3+am8tP+r
         vI2/ITWgoRUPuTi1TPCxaexS0NTtR8TPcc6AVU7/PrbpuUN86zX13CtVIAr1nUDrNc6C
         OhiQ==
X-Forwarded-Encrypted: i=1; AL+hErHwQbFVPpkCmQzGx4S6rlLHn6X2rutECUHkbXiIwLhRKnuy++0RreOtT8kJIkMlX7km57zyOrx10tYLwwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BPYEohh854u42nWZhFbZ4lLXIQU1I2UsBAyQjeZaqDX0XY3T+
	ZPZC4wRQTuoVQ8F5pSKZ0c7xqWQjwnZQN5CKIT/Vn67ZlDOVrW3wAW4q
X-Gm-Gg: AZFdTZfb6L0rM3LkeMRql3m6YhjjJ6CVVpZ9PiCSPWe5YwlGShRji7ThBtABWUbfSQ/
	LLwtVR4EC5k4j1iOJfMmJ9qYpYrzKrnMSXtxNmGp97iiyxsQ4/kIY9xXIr8EOS2JtRyW2Cs4rPA
	cO1ecUhKNUPDu7SUmvpWOiiiS2MgXh2h7XoeBlIcdglk1l4Dr2ErI3PAI9NYjgYvSf9vZCD6sbR
	6az6DxWXJlagC8PG7sfZZn3eda2Nr/ab58y0CphW5MAsipGrh5e8/EXhDEqo1GBLTQY0dj9JMku
	eE+QNqQSQW0S0P78tUsMSHweIZOf+BlN+IobQRQxta1a9xfOV7zA4Bx4G1aFG9qURtVyHptLgFL
	7DxQpZfWS3ZZkboPTDj2ChUbf2HDqdjughyM04Dl8WqTdq5bzX0YnDlMHZj1fRolr30CUsxLf2i
	sX1T0XtmHfGAN+sGCiKhCXpwxHoq8XzhC/gjpEOm3hZP16wTl8a6XY4rMeuo6H2SDzhYB08BDUy
	RWwmobUkh3wPJv/qkYituyAZqCRHmtZvIAT4RmvH8QWlAzkYNLhHx50yMT9taOLCPtwIz+m+6mM
	QRdzcgkGsP8gjcNCqvTXzASB6iQCOtc=
X-Received: by 2002:a05:600c:4584:b0:4bb:6c71:b269 with SMTP id 5b1f17b1804b1-4bb8881fbd2mr479775985e9.28.1795776016441;
        Fri, 27 Nov 2026 02:40:16 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb4341sm46259273f8f.4.2026.11.27.02.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:40:15 -0800 (PST)
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
	llvm@lists.linux.dev,
	=?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito@redhat.com>
Subject: Re: [PATCH v7 15/43] drm/vkms: Explicitly display plane type
Date: Fri, 27 Nov 2026 11:40:01 +0100
Message-ID: <awld6GvGP5acwJxu@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-15-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-15-21194cda2468@bootlin.com>
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

On Thu, Nov 26, 2026 at 12:28:58PM +0100, Louis Chauvet wrote:
> Debug information are mainly read by human, so use full name instead
> of values.
> 
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index c5d90f7e934a..e933d61cb526 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -388,8 +388,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  
>  		vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
>  			seq_puts(m, "plane:\n");
> -			seq_printf(m, "\ttype=%d\n",
> -				   vkms_config_plane_get_type(plane_cfg));
> +			seq_printf(m, "\ttype=%s\n",
> +				   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
>  		}
>  
>  		vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
