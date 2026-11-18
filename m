Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004898;
	b=TagXK8ni3TG2huC3Ej3TTIJyBHlYjQ4jX/04/2uFlq6U+16P9/PiBmA9a7sujREQnKhB
	 mtE0FEwzSRfQVOvDDc91uRRrykKIHNDDtYgLraxenX6w/CaJbP/0Xj5RePea+XFGlVO0b
	 jnmERJCnnu2BBKO2eglF+eTJMouRaOpIDOGqiDkXfja8JXKtQn4k4/CQyVCCoI8oCH0I2
	 Go5S5xUvS3vRThTG1g2DgdyWXlp/0dZ0rBmEcA8LuR+zzo45aqTLv9bFITFiU2zyRWnxq
	 gWf7+dgddzSDRWCHf4KjowlgsLSJ1KAg4NyIMK73t2jTeBTHc4lfE0PKqHhXYu+0miQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Sbg0KLhjP6VImCPLy3d1+inU/8Bcn6/seY59UQYwN7I=;
	b=d/1gPmRSn/cGkbkY+ifedOTAFGb4yIY1WSufte97izXu3Dgn0cY6PVuxL/ecn/mqzPvV
	 xdZzICkvct6XYpvoeQp7Sn/9ks2QT5A7/5NetmnUUagNGf+RVD3LgDPunEo/RNvmTHqDo
	 gJY8chwmZhV9b4FDfvj6iD+yWbHssUCFuMk3Uym8q1PMXZU+hivNr9lHje+UstZMYw4lL
	 sYascnXQt9i4+ujSVTSe1bjZhEyGiesSV+p9vTnktqo5yY3GzsypCkiOClMKyH6JtVeDQ
	 4NgDsi7HehgCxjEdgIZDwPa/adrng/6Ym2C7E8Bax4y2ayHBv85Ja6OOkm6mAOeC8kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TBQhTOrn;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2839606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2839606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TBQhTOrn
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so8599075e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004896; x=1795609696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sbg0KLhjP6VImCPLy3d1+inU/8Bcn6/seY59UQYwN7I=;
        b=TBQhTOrnnS0ar/e0kk7km69A8QdgRM+sYN7qDTa0ZC5LwiqXxtyy/jR9q8qCj6x12U
         mNaSJjFs/wsR82rqLlJIGvY8H3rdzhQZ8MKMkZIA7Ok/I3dhaghnrR0DFSyt+uZlXVat
         IehcWYpNQVgZWnqthxrfFpi1FBOK5xprYHlSjY1TITswsejUpfATvckE7OrSgEfwM4HQ
         QeWq1/5L9fZY6AZ6LbhNmXgcKruMeI1PqT2H3OaSIydGpE3uEqCSHIH2wsONkGAGvAfl
         6bxEeF3P2bSuIgIipSKOcVbUEmJmX166ehnezVcgVHukyOQpp5QvzxoSR/ktTGZTiHZj
         uDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004896; x=1795609696;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sbg0KLhjP6VImCPLy3d1+inU/8Bcn6/seY59UQYwN7I=;
        b=UOC6iXLvUJr4cIRAavvX9SPnKGKc5VnM9jedvzJ4Y0J4zWbhaf6gCAZKTpjlbBlIkc
         5wYTc9cfIlmjvF7xU0HfI7ZdyiDhTnjNbulF3qld7iTNhEdlKj21eTOu9PzL7TVZhKGh
         hdWNa0eUlZi3/vpYvL5NJn32ZIFJ1aBIk+CjvtR5AGdCEdYT41jC3rX6bfMdFH+VU4pO
         1lYw+vfleO52iUVi/bwCaQOIoHbJ3U01Ye2mQ6fmjWNDHuR8QUECbkbY9NBarSBQTQiS
         4dXScyjJ7oA8tRMr6BkJoiQNttRQgDQ6zzUDFymLp3rgstJSVD7kvIefrIR7LsakThAU
         kG8Q==
X-Forwarded-Encrypted: i=1; AL+hErHFr/Z2O2ghL0EFSrPugyskEnxl6Ebu35Jr0/Xd+WVUrOTdRzqdkhwp5wCrcH4lb3ZMdbKTKA1JVVRIHdU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IKcZuMgt8O6r73UPbckaJpb/ifQZXZntyBJknmt3U+VkPLsY6
	u4OvpnP1gsiuTSXg+nJTBYmGRJCVWAbX2FO6XVl3D2HH5eaRdMJtfchFObjqksS5aME=
X-Gm-Gg: AYBFou3hdvVV8Upw5MrGvUxSBEK3XhQBZC2AcvUsHWdxF/D0A9v4UzcgW1s5cy8nSGn
	h6gDCrdj0j2TBKhEfM77yz9XTkDI3KJACxVkUh4oKPkyDDznSdvlAi/lrTnoGRDebcFee2snuhl
	v26K9K7vFNz7qXZgLU90SZToWeHWlox3eKgh0NkvcnGt2Adh3G4/Yulyq0VCXXAD2wQYY9aPRSc
	aAemeHIUvVDGyVEOdf2xqCJ4+eIt9RNiDonr2M2AJe45+Mg2r062T88I5UIQYQm3/wJkCuu4U7L
	iOBgM2wFQKZ3XbA4kU6bgHHGh2lpKsIn2QJa0Fn6yexnebS9t4/LGnCDUZ2c21N3SoFhChZJvxI
	+qYM+d25Lk8t/CllHmBTXmMDYZ043svQNgZEjkTJeDyBUEUuNUa/+t+2c4XeM1lpBTLaSqkuxZ5
	ZuMH5SDEt6iyaxB7vBzR7rTjdKa4TTpDher1UGisZViJzY9Z+iPhIrHrUj9VlCnVYY1edxc1T6z
	7Xs8i4Y66q9CAlBBmLD1rrL9s7y35Bvxo0nnOKM1bDcWMSU8XxNMlbCxRK4Tk2YKdyNk40RS0BN
	PGWKcI59YCYol/00HMFVe5lYCO7Hx6aXKXyB426ZUMTka325SxQJ3tWkH+DJ7mje/BD7+mIZu+O
	VRw==
X-Received: by 2002:a05:600c:8b63:b0:4bb:6871:8f21 with SMTP id 5b1f17b1804b1-4bb7da27fd2mr44906275e9.23.1795004896063;
        Wed, 18 Nov 2026 04:28:16 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2abfc4sm64858355e9.7.2026.11.18.04.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:28:15 -0800 (PST)
Message-ID: <6291be5c-94e8-4a5b-aa30-f797672e4165@baylibre.com>
Date: Wed, 18 Nov 2026 12:28:13 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 10/12] accel/rocket: add a GET_PARAM ioctl for the
 hardware version
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, ulf.hansson@oss.qualcomm.com,
 abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
 sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
 chaoyi.chen@rock-chips.com, shawn.lin@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <bd963b70e40af3c3c74ac1569cda7be885b0ada1.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <bd963b70e40af3c3c74ac1569cda7be885b0ada1.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14/11/2026 03:05, Jiaxing Hu wrote:
> Add DRM_IOCTL_ROCKET_GET_PARAM so that userspace can query the NPU
> hardware version and pick the matching hardware description, such as the
> SRAM configuration and the register layout.
> 
> Add DRM_ROCKET_PARAM_HW_VERSION, which returns a hardware version enum
> that matches the device tree compatible.
> 
> The enum starts at 1 and 0 is not used:
> 
>   RK3588: 1
>   RK3576: 2

I wonder if REG_PC_VERSION / REG_PC_VERSION_NUM could be used instead of
creating our own numbering scheme?

> diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
> index ef7043046bc6..50c8b05bd394 100644
> --- a/drivers/accel/rocket/rocket_core.h
> +++ b/drivers/accel/rocket/rocket_core.h
> @@ -41,6 +41,7 @@ struct rocket_soc_data {
>  	unsigned int num_clks;
>  	unsigned int num_resets;
>  	bool task_con_16bit;
> +	u32 hw_version;
>  };


If we're adding hw_version here then perhaps the task_con register
selection could be made based on the hw_version field value. Then we
don't need an extra flag.

> +static int
> +rocket_ioctl_get_param(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct rocket_device *rdev = to_rocket_device(dev);
> +	struct drm_rocket_get_param *args = data;
> +	const struct rocket_soc_data *soc;
> +
> +	if (args->reserved != 0) {
> +		drm_dbg(dev, "Reserved field in drm_rocket_get_param struct should be 0.\n");
> +		return -EINVAL;
> +	}
> +
> +	soc = READ_ONCE(rdev->cores[0].soc);

Does it make sense to do READ_ONCE if the variable was not written with
WRITE_ONCE?

If my quick read of commits like 89c2c777df17 is correct, it's possible
that there are gaps anywhere in the cores[] list; please double check if
it's safe to always assume core 0 exists.

> +/**
> + * enum drm_rocket_param - parameters for DRM_IOCTL_ROCKET_GET_PARAM
> + * @DRM_ROCKET_PARAM_HW_VERSION: an enum drm_rocket_hw_version value.
> + */
> +enum drm_rocket_param {
> +	DRM_ROCKET_PARAM_HW_VERSION = 0,
> +};
> +
> +/**
> + * enum drm_rocket_hw_version - the NPU, one value per DT compatible
> + * @DRM_ROCKET_HW_RK3588: "rockchip,rk3588-rknn-core"
> + * @DRM_ROCKET_HW_RK3576: "rockchip,rk3576-rknn-core"
> + */

Let's not document these as a match against compatible and their values,
just state it as a way of identifying the NPU chipset.
