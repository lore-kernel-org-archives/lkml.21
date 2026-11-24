Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528613;
	b=gNrESENmevMwlqup02/sqsLOWoQpEInz/VYkKcDR/KY2Y+EL88Hi4qXtpVosk1zLbPbh
	 tbs2tLNawXB+Asv+PA80HRHngDcGj0WACiNSVvbuptWiNocxVdsKtUmH7dVGoCrfBTB6g
	 qfNB4X13E8oIzxGdorWBOnOeG+Yf97RzesXcnlLZo6rh7zxjeHIhNoIz8FqAiYmjQEAHL
	 +RUDenu2jK7NAsOUeMMph9A8+CE5jaEDR42V8SI6Qbi5CQtHlhwdjk2k61VQ1drSyXdC6
	 OzePC/smeatAeVXJW6qrPbW1qBQF0t0okW1jk8L+hCn4Rpm2b5PT6BhacRLM6EQUxUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
	b=oyvVati71OEEWF39vBZkX+xRslWDVCBgVmVAzIV6vDc/M7LBLZsP9yJ++EEhnVSzLx+9
	 W3k7NPa4oJ7WJ6Fut4QT8jZNfKC/Scmu3r/l0bKVherBH07C5BqMImDPjPk7arBWwonp0
	 mVr71iMMH7MVBge2mtKVj4Dp6eG8kot+W9s8hRXyCfFYc1qZx/iGynRRVm1nW+VDIVdom
	 daEtOO0YiBBsrv6S3uuDSzbk4+eI5JzsdCLEpIkiBou5+npudYFlGSZKBWd+F+Lc3tWnp
	 iGqm6HdlhY1TQmcMxG9y9MTul3dH+w2aWO5BbUoyZEEhznOnZ5KNk2+q1uvro8zv0Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DeNL4hzN;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF09B606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF09B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DeNL4hzN
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2939259f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795528611; x=1796133411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
        b=DeNL4hzNs5OtMyzBe4ENjT0H0+3w3ba11RXLHxbD8Sz4L+qq9xcE/oYQmMaECTddYF
         Ame3yubqv4Y6QWFIgbaSsDXeGPPvjncolpWbmGysR3Tizb573kgQjBA3dZ8uMQyj5MMW
         n9G/C5zrR6QNJda4AmhznpxBj21GrByt/Elixf5FB6Tv02h0AI4oQNDw7QBsIRez3nuo
         z9Sfm2qZiaqcvyJvuz9Zs1GUlxAq1D2aNYfyOvQK/Cg7mwo620EZcyi/FFZHZavR1ckL
         60sBqYYrpNPSSyiqQmvkpf+UetkHnSaL+jD/1+S0Y04yjcFAACKudGPAMFbtHun2we30
         xNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528611; x=1796133411;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=anD5m1AxXBnKPgg8ZQZ0gwUoffnh9QZT8UfPtY8eE3c=;
        b=BRd6JozxNxQ3BO12uA59RbO9I29CJoXwV8aWQmnb3E7/os209TqTR72aJ65ruGezTz
         KMHfNmKsYh1dV4mUIe6Ht63KJVHIxGqakuh/mkKa4aqdlIvNBiih2kY9tm4ar8GjaO8y
         o3yJnLr7WefijvevPqlrG5t62ccC4jw/49EPDo+vZrCroP8QAIsPoIIHS8MoIi/hDgZQ
         EmpUlGlI6yjOBeYEQemNpR42ewrgWOidr8UmVKrloj4cXeup83ik6auZT5fwLw6ymKg6
         ayg2tu34XQBzOD9htXHG3Y6scAH290gpszNLOU364yTVPI2UCp6kMPrGxzsudqFpxr++
         9W+g==
X-Forwarded-Encrypted: i=1; AL+hErF6hrPwvN4inIHZxvibsp9M5V6J3imBymi1lJ2Qr5Ug8NhE9tqjbdBw8kJG1wpxteVSqV2aTYt5Yg7q670=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5rBPYxUxOkYyJ8mef2GSQYmXaiYpS8pXtkt+84NeLvjXBIFpR
	ULJmJx+OnIp8cOE2QdEKi3wH4QKbJ466NmPP5sp+1BvbyP5KnUjygwS1
X-Gm-Gg: AZFdTZfOU22sZQVJOxc2mAm1YXtQ1e2u+so9nXWT6xDibuCCSXchBGoONDwvviPTxen
	ojPu3yMgXLJ6tGlP9EXawTwubvPPySP0by86L4uBJFnVkErK8foJWGgZHZLVQgQoI0H/y6B0PcB
	I+4blD5bUrvv9xn7zDsMpkuHx8JJc5uIieiLYOO6TseqaGeVwBqKO5/dyUusIZlwdGXFkNewMdI
	wfDxXgzkVbZiznP44TGE8GilsAS8fhY+roN8Nc8Jaql55V4ZWlEK9QGsEefbXlAz4NFVia1LPiT
	zD96aBIV9ptkcu8y+HzsaA7ojiQsdWLCd9+WM1VeqMW3hyM//9oC+y1NVdB3qQOt+gdvnSPtmkF
	q21uIRI6MKxBtyi0qcouFJIff0yfoqt5XfeW/VsgxEKqsQlYmTvrHkz+o5++a5/7kwueTa+Pski
	MCGkqDCtLYOUzdxf/N/9xHw6Xim3JcYYkXnytG1fp8NGsI5C/v7oP9ouGH04vHu6THHHKFQxUyk
	gPcqT4TotdKsgrWW3lnCfe16qiTsdDFGinIXzf9SP3oiFtkEBtJOni8l8yIKsLGFPLGJWptZpZo
	koVm4PCRPi15zcK+4+mezV4VCTJgCtk=
X-Received: by 2002:adf:e197:0:b0:492:b5d9:feb9 with SMTP id ffacd0b85a97d-4abb3a4d8f7mr26010339f8f.30.1795528611263;
        Tue, 24 Nov 2026 05:56:51 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm28936616f8f.48.2026.11.24.05.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:56:50 -0800 (PST)
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
Subject: Re: [PATCH v6 09/43] drm/connector: Export drm_get_colorspace_name
Date: Tue, 24 Nov 2026 14:56:38 +0100
Message-ID: <awWXgzY_0Q2Wtn7n@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-9-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-9-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:51PM +0100, Louis Chauvet wrote:
> Export drm_get_colorspace_name so it could be used by VKMS
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index d66188521881..fbff5871355d 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1528,6 +1528,7 @@ const char *drm_get_colorspace_name(enum drm_colorspace colorspace)
>  	else
>  		return "(null)";
>  }
> +EXPORT_SYMBOL(drm_get_colorspace_name);
>  
>  static const u32 hdmi_colorspaces =
>  	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
