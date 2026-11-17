Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948009;
	b=gRRW7zZceAoDZTF6/Gi1+K11Y1P4l6HQf6CmVfusWZhjIsw7EI+3d4zxgyfW5JZNDGji
	 jtMd6/BH9Z5Tj9sqK1OmTd44a+lsyEAoy0pM3HzitnOrIki3c2WLb6V8CUyQS4WB4wIl8
	 FvSfsAKk+vEk4dXkGiRRRXCC6eQNvJKLJrtJs7vDGFXJUUXAf/yWJhXaVkwvBdWwampec
	 DZfkRbBKVOOLg5u8/AnPjCEGfdthvj7FmHdadBSkniUpDQQgIXL1523Soex6O8VLwytM/
	 shdqtgcdtGfBHYZvjIT3aGCjBrjdMqLZF0D1xapxZZ4rD9XEmikfAylOEynZxNUGa9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=+zkjXBeMkEDc7QufXqaSGB6NEDq0WBn2vnhWa4XM0nU=;
	b=XiBOeUzYW76OSDX7lvrAwBjB/TnJzHWrYDx4Lr747b6mjjT7AfVD+iz9c3QsiMm1jJbn
	 KG7ySsd2h/AeKXbGXVDGVpS5lFABKExKkodtJvXxwFQNhlYS4JDKmXhwF9Ym0M8HTO/9V
	 OHYp9uE9fTUevd2c1q9JM4lxgpNs/4IJ7+FcbKQhNKE13AqEMv8Sg8wFWwDjZsP+KitXo
	 OcnRoOnrhk9w0CfxXrmkUW0gIJQzQpZ4Hya11kCmlrOW8YaDtT7xS6PY81KNaUqPCoYnk
	 mUkI191eAI9f8XFM4Pv+oMc/lVOHA0vfW2nbEnpX0u/zA96Jg6SE0x64m8O6PaoLVXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQiTHEmc;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6695A606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6695A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQiTHEmc
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-92106d5371dso1474636d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948007; x=1795552807; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+zkjXBeMkEDc7QufXqaSGB6NEDq0WBn2vnhWa4XM0nU=;
        b=wQiTHEmcLJ1w5dl8W2ZrpxnxgBRRFkilfGpWObOByVV4ZYPw/L+jCRd1Scet6nixi/
         YeuzcfJncBd63FE+zpAuuNmoyZKqAb65YnbzZMsWF/qZ4QNZvRpkwhDzXo8Tx0BaUefL
         e7fKeoW+QD8YekVedo20sv8Qve0pX2hmS+p9KBznLxnZXk/Oco2p06XjUYBVeTelSg92
         lWIeUbfDatuFMCbU40OQKvqQLmnN47Md6n+LyaRYhZUEYj0JjmKo6o394rvpJ5XUqNmC
         vk5KDIcarGarUX9DogDTjL+kNjq18fEh+H/j16Xtr5IIQKDf1Hnry0JHY5tKID/GOIkW
         xzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948007; x=1795552807;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+zkjXBeMkEDc7QufXqaSGB6NEDq0WBn2vnhWa4XM0nU=;
        b=NaTvJbqgbD8VHHh+G99Z93n6At7YEc+SZszsT61seilkN7nMlAFoBWjgxLa6H+1cs2
         102uIihwobTGB1gTF9+RjC8Uv1nsEYhsORGdus1J/7uT8fENYEszYJZrPTW/+lvJmNLE
         j2o/Gqn3bDHSKXKPy+pe27lK70znuVuzcHvrtQfnFEvX6SjA/7fp79ptV+W0isvWj2HO
         l2/f8k9FcQ/YuO4V0iK7KSAa2p46PzMNGpP9ATlrPDEql9vwa5JeyoUmveh6WWoboK0b
         V/nsBYBuTJvqh1tN3SsxcBotDmUzxTvaiGDKnHLPB8NZg9fotYh6X4wsoW+3T6vh7Gck
         h78A==
X-Forwarded-Encrypted: i=1; AL+hErHwYtCcU7sImEoX56PT1PoRh3FPwn1yeTYVupZExnlgJq1Ae4aomFyB13wRR/5KSiYWBQao18hMo5o3I3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z85sKNw4D4ovBx0BDuPZ4RVVwBMDH8G+AfYVyGIyknHj83jFD2A
	VfdCz2um7IJkf1ySQl+E5z3aulzw+4Uncvyv2JUXdZwc430swWcF/FVf
X-Gm-Gg: AZFdTZfOD0aNF0lT2Jl7TwP4etYR7JOo28a8lfyoLxlIFMh9sePzEM7x5eeITh2YYGP
	IOsH0Cmk+gcMHFDswPWCKgJz1bCFJMSozT6C4w6EMjKe1fEW3YiTNV/M6B6CQTIoVAsjHD6J4tK
	uCREX3v5J72VPVkDuoTibWWH8fId74B+gI+Xg8EgUM7jLNstVISf/KfYlLwAj2E1tWAIzA6fW2X
	sxONg9hXek6zfxj4xjs8W+x9tWtYJIB6vxc8nZrz26f75mzuBFzpFRkKtUw72YKblsrpc1CkyUD
	FbTDbc4eseTUJ36KU2fErjXUfGU5ktRt60IU7ctZA60eDmuyW6oxB8FMsS1M1K00TU712WsUvss
	oowLVT3IAsVVO3HOEqKYbV/2JgB2ZVwhC5pk1ES86Amqvvv5kxAa13v6AB39xYw9sNe72Ro+1Dz
	IX0hePb2mYJCVYpYXE1bjFPmEuJoGK+qRtxtbRqyRRmLEry8qddMBgghy20UhkU4jU8f/+5IjMM
	FR7fwSoE7w40TUcUpgopBGyQIB8VlGeS3PW1NhbLqfu18zMkASA20aaahdZVmDJX5CToksG1cDo
	ex9TitD+zqFmqurN5XGCbme2rS9fwbTrYA==
X-Received: by 2002:a05:6214:449e:b0:917:8c2d:4283 with SMTP id 6a1803df08f44-920fd36e10bmr57938796d6.22.1794948007115;
        Tue, 17 Nov 2026 12:40:07 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114db5db5sm2876646d6.43.2026.11.17.12.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 12:40:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 15:40:02 -0500
Message-Id: <DMXRYOOJPIXS.1DIGZP64RMRLW@gmail.com>
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Stan Iliev" <stani@google.com>, "Tony Nguyen"
 <anthony.l.nguyen@intel.com>, "Przemek Kitszel"
 <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 <intel-wired-lan@lists.osuosl.org>
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Decotigny" <decot@google.com>, "Madhu Chittim" <madhu.chittim@intel.com>,
 "Emil Tantilov" <emil.s.tantilov@intel.com>, "Sridhar Samudrala"
 <sridhar.samudrala@intel.com>, "Brian Vazquez" <brianvv@google.com>, "Li
 Li" <boolli@google.com>, "Alexander Lobakin"
 <aleksander.lobakin@intel.com>, "Daniel Zahka" <daniel.zahka@gmail.com>,
 "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>, "Kees Cook"
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH iwl-next 07/15] idpf: psp: add support for fips
 compliance status
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261117145522.1910636-1-stani@google.com>
 <20261117145522.1910636-8-stani@google.com>
In-Reply-To: <20261117145522.1910636-8-stani@google.com>

On Tue Nov 17, 2026 at 9:55 AM EST, Stan Iliev wrote:
> Add support for querying the FIPS compliance status of the crypto
> offload:
> - Introduce VIRTCHNL2_OP_GET_FIPS_COMPLIANCE_STATUS (567) and
>   struct virtchnl2_get_fips_compliance_status_resp.
> - Implement idpf_send_get_fips_compliance_status(), called from
>   idpf_psp_init(), which logs the status as
>   "compliant@cmvp_cert_<a>_and_<b>" or "noncompliant". The status is
>   informational only: failing to read it doesn't disable PSP.
>
> Signed-off-by: Stan Iliev <stani@google.com>
> ---

[...]

> +
> +/**
> + * idpf_send_get_fips_compliance_status - Get the FIPS compliance status
> + * @adapter: Driver specific private structure
> + *
> + * Query the FIPS compliance status of the crypto offload with
> + * VIRTCHNL2_OP_GET_FIPS_COMPLIANCE_STATUS and log it in the legacy
> + * "compliant@cmvp_cert_<a>_and_<b>" form, or as "noncompliant".
> + *
> + * Return: 0 on success, negative on failure.
> + */
> +int idpf_send_get_fips_compliance_status(struct idpf_adapter *adapter)
> +{
> +	struct libie_ctlq_xn_send_params xn_params =3D {
> +		.chnl_opcode	=3D VIRTCHNL2_OP_GET_FIPS_COMPLIANCE_STATUS,
> +		.timeout_ms	=3D IDPF_VC_XN_DEFAULT_TIMEOUT_MSEC,
> +	};
> +	const struct virtchnl2_get_fips_compliance_status_resp *resp;
> +	struct device *dev =3D &adapter->pdev->dev;
> +	char status[128];
> +	size_t reply_sz;
> +	u32 num_certs;
> +	int len, err;
> +	/* The request has no payload, but libie can't send empty messages */
> +	u8 dummy =3D 0;
> +	u32 i;
> +
> +	err =3D idpf_send_mb_msg(adapter, &xn_params, &dummy, sizeof(dummy));
> +	if (err)
> +		return err;
> +
> +	reply_sz =3D xn_params.recv_mem.iov_len;
> +	resp =3D xn_params.recv_mem.iov_base;
> +	if (reply_sz < sizeof(*resp)) {
> +		err =3D -EIO;
> +		goto release_rx;
> +	}
> +
> +	num_certs =3D le32_to_cpu(resp->num_certs);
> +	if (struct_size(resp, certs, num_certs) > reply_sz) {
> +		err =3D -EIO;
> +		goto release_rx;
> +	}
> +
> +	if (!num_certs) {
> +		dev_info(dev, "PSP FIPS compliance: noncompliant\n");
> +		goto release_rx;
> +	}
> +
> +	len =3D scnprintf(status, sizeof(status), "compliant@cmvp_cert_");
> +	for (i =3D 0; i < num_certs; i++)
> +		len +=3D scnprintf(status + len, sizeof(status) - len, "%s%u",
> +				 i ? "_and_" : "", le32_to_cpu(resp->certs[i]));
> +	dev_info(dev, "PSP FIPS compliance: %s\n", status);
> +

You should think about exposing this with a netlink uapi instead of
making userspace parse it from dmesg. Maybe PSP dev-get.

I would also suggest moving this to a series after the PSP
implementation. It doesn't make sense to have the PSP driver API
implemented over the span of two separate series when stuff like this is
in between.

> +release_rx:
> +	libie_ctlq_release_rx_buf(&xn_params.recv_mem);
> +	return err;
> +}
