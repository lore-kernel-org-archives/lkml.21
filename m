Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776084;
	b=DlmO3hQcxQdS2vr1TTpZE1APHUus9npwJRu2+HDUPlG/cNSkEi0jPIArkUgq/moq8k9g
	 53Vy/o6DJoRCEPW1slT817lj5HbYBEZMvLjtc2aigE2yDRkd0BbSrEiOlwCOFExn4ody1
	 u+FQ7oSYkdRytd7Vqpxt9XgBcJNHSgGYDYLUt9MrrkYTe0KgO/++WzdNrNG3vfgsTIfq/
	 A1mAMU+YbaESN7g1r0VAeLrohSuXsdBOq25UHiFjGwrSegNEUBzA1lA/QaK0MLWjiohZn
	 DJ9Us5cHlM15X/fXPXiItYf2k6ED5ZegB9IzjRuJ+2DJ9bC6N+StD1F/wHKTAaTljJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=OE3iaTdUoerIU9O/A0rtQ8dKzE06q6SN9k4omG/eVuE=;
	b=lxam8hQhygtkXfd1VqYBr7VijzlU7pPqitzumiuMNcOsHw/VqPsp/VWpfiZyLmpyqQ3X
	 ORWk/VL5apFLS7P1m6MNq0p+NJEi2ecLn0oDdcYTss2UR8LPITi99S/RmSgXsfYgZpJmy
	 Di8AeAgPRB7TomqAfs9G/BSH4zIBzaR4IxVMp7/pH6gGWBdFminctw1+NDmKAJ6CqQogQ
	 OFIQQnH4fbcv4DNgen5X4b9YMzDsepx1sBboRaEvMAZW9JiQ5o3oCXRmx5CPo6Ef0smHD
	 cLAMlmMWrmhMujSsWbQzINylJ749lXZVS2NrkaRt1gkGC2AgxMcPA1Me56vHk6HrxOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AcJ6OlZO;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6CD606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D6CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AcJ6OlZO
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso80042465e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795776083; x=1796380883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OE3iaTdUoerIU9O/A0rtQ8dKzE06q6SN9k4omG/eVuE=;
        b=AcJ6OlZOCKEvuF5GrN5ji1kmp4WCXfIfuq5PaOd5dkq13PgW+ncjRueFD0QvMYsXRo
         QL5B83IWk0aChQzJDm0Xds+hKA8ewlH9mC8k0axkYwKTAHpklXcgrI9zhT1XUd5vhGTc
         3JQjhO/jZCv414m/e+RhHTr04S/eyTTnycYCt4Tb1lBk+azME+3WpRklO/KeXYutv8GL
         M2Hdsw/0+gPS3aAMuh9oZ/1rtCJZIizIUJGDkv6IOuQEG3Rx2Gj7Jmxn0oFMRGyrY0ZI
         daYL5fetQ2NwNXxYlThlt5395/waKfz05usXL9x3YB9N4vI5m76MrqTYLgdkPpIDSEbj
         N1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776083; x=1796380883;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OE3iaTdUoerIU9O/A0rtQ8dKzE06q6SN9k4omG/eVuE=;
        b=1XGTlgSnQ1F2uc+YqsORRmMDA5S5IPOuXeIGsEbVg17xEz/MekWxiS/fgC7DAM9lWZ
         Bqprruq1+7GAye1O24NeW8JFtpePP5AUurnUpKqiLYcd0SOwl1iGvaNIw1lBgL7Z5TuP
         S6M7OIiQooEWwviXGGp2Z/MhXnKfuRM57b2ir2/rCyGL8I8GjNFilHPs6/BGyoTm1uOQ
         U2MInanla24pzhrIqjP+n7jPH63thNktNzmCZIQ+quXSe3M7VQj65f9EZNVqYnoB9myJ
         UcLacBou2plSY6UJpeet0WSuwgfB/wKTFWsYnj6ULterZluFeJ7uxqSMgRH35Zg3A/rJ
         6mTw==
X-Forwarded-Encrypted: i=1; AL+hErHVZO0upUyhXym6pV9L+OBHcKY8Fg6kcu5UEKc7R/NtuqcLQaps6NioV+to1nKjg13SebPQj8ltQy1Z0wg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dhopD/C0L2sdWI36oYl5Rm9rj2j12Clz9wyOax+BgzGZWr0lm
	0XbTHR0W7Wmy0DXaDdgbgDygzfx4eLtf6Ets5/eKA7hWEPQpIKpEMccw
X-Gm-Gg: AZFdTZewT4JbflPKV/LVhwaTYiA12dX4sSWRNUxE7f+k7d1hPl0Y/gG6seYxIaIUXHk
	GxqVOz9oLplcn21AK1m+wzkIX3+Z1Z+x6DNVsPuXTadDTtsEozo400qL7vkpBoGeEbzznU7nyol
	oe00xoJaxjm/HNAKp4yGUB8boQg/ZvnK011OeTHKQ9zKUD6Zp8VCAKqVuERuygqAdCyt3ZVGdBn
	IETsEPbGKun+FfU/SX3leoQHN+LC1s7+2sCyDv9tbmxomFoI7tQt21l+qCrRMiMbWgGVBKshRVn
	0q525c+JundWFl1Enen7NWWQpDi57mpFrcng5B9P9Rkk+NU53hX+vvXB5kR8n+k6BFrxrVjEG5o
	0DJMupoPP/JRjUrrygmKn5Y8phBoPovNJ48bmL8+2ceAbCPVN5BQQ3SII6ZPPJBiUdxdpNjKybP
	fmfM1nqSQ/6PIYMxEZKRD5uYN7ZjQHiPA2an/pfrCG+ld1o6kejtqaSRjVUlfZNsYJLbaAGxunV
	LDDs+kq9R0qkKbRobwqWLMoWZNLDiLTkv37ruFmxNO6yIYzWeNZPayUc7JZwWfCFAv6yg0xQd5S
	NHEMSd2vlxgvgkkFgYfredrih9hqfM4=
X-Received: by 2002:a05:600c:848d:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4bb88811da9mr501158075e9.13.1795776082653;
        Fri, 27 Nov 2026 02:41:22 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm797348905e9.11.2026.11.27.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:41:22 -0800 (PST)
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
Subject: Re: [PATCH v7 16/43] drm/vkms: Use enabled/disabled instead of 1/0 for debug
Date: Fri, 27 Nov 2026 11:41:08 +0100
Message-ID: <awleOdfY9e_UnwVF@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-16-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-16-21194cda2468@bootlin.com>
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

On Thu, Nov 26, 2026 at 12:28:59PM +0100, Louis Chauvet wrote:
> Debug information are mainly read by human, so display human
> readable values.
> 
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index e933d61cb526..e2b656723898 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  
>  #include <drm/drm_connector.h>
>  #include <drm/drm_print.h>
> @@ -394,8 +395,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  
>  		vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
>  			seq_puts(m, "crtc:\n");
> -			seq_printf(m, "\twriteback=%d\n",
> -				   vkms_config_crtc_get_writeback(crtc_cfg));
> +			seq_printf(m, "\twriteback=%s\n",
> +				   str_enabled_disabled(vkms_config_crtc_get_writeback(crtc_cfg)));
>  		}
>  
>  		vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
