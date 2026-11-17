Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949041;
	b=KuGLOS/ZYfyXsVfrwa2oEBUtuqD1YfUUvFquGQqFZPv32AX4HJyTBgO31wfEZTPAy6X1
	 j3+elprZfyahPk732R8yX897kVj3u8Kg+k/lRxNp87W8rActGB+wakHDRvElfztIMSKy5
	 se6cmuvzyZPEdaZKAqAHuwJLA+rD9zH4atQQx0KOCc9Wos4KnL0C4aisb04WL1hM0p5H/
	 XvZ+7eLisuREB/tXz4ur7BrTsKTooJH9ytapMettj/1+EUbk09mysf71jHqssDvfkPX4x
	 MpckVBfcbwUrmGTnQa/9mlc+VV9urP+54vuwRQW4t+ny+dN5UvudVAsxQiX574iL4Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=xJYRSoH4guj+EsNxTlD3hMwy4BVgc6CPsDY4Mrde2lU=;
	b=UW0nlxRvoDlyy4jD86N4bHOcIdoSRdMYM5k49qyEqWgUI9MMUhVqbKOXwotRzyOqlXj7
	 SvLD6le+zlxTSiOpAB+VifcbKHlxVzJ+aWFc74ePKoN1AhfdMmW/pszf5DwiE05K1s6MG
	 oFzvsvf9KMvcsuvLKRdi1ncOn+K6lZsHNzf1s8bNgCPTBnRCAV3zuNoIebPRdoM834L9i
	 LfFgcZyy20ck5zju6F+S3t2hV1Ez/6ukOP5NayFVMe8SYnXz4XCWMo4Jh18aedrM1FMri
	 0OzUT6MNJad6qzNNO9rGkPQCkB7xmkxeTCRU+UfIGRzuLCdWh3FrcAeyfO0R/uNjNcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="oActs12/";
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD89606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BD89606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oActs12/
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91f2b826fe9so1393776d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794949040; x=1795553840; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xJYRSoH4guj+EsNxTlD3hMwy4BVgc6CPsDY4Mrde2lU=;
        b=oActs12/xBkJ9FwqcYoMoPLl8nH0F0LqGDn5xR2oN/Z85LKpMrxDplxdHMCDpntfFa
         lj41w4AvWV3P1Fx8Y8Hwh4jEL019FVOWGbwy/x9vctQbE9NviFebnMyg/qHIWeUutNBQ
         IWCoz6IlyIvV+9t50BqXQ616Grhj49TV6Jrnf00W2kXMONKAASxCA7GcIFTiGajORVu0
         8durIc7MCP8fMMNV59YvkhB7YmCYyAA2LgYdBK24dI9GbPPX085ZCRQuJ5ysKGL4TZui
         luwWfiNNu4OrgYy9LdovfSfjtfHCZI6pnAqOzGYBnEKtEpIUM30yrLtuAcjgFotAaCCC
         nU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949040; x=1795553840;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJYRSoH4guj+EsNxTlD3hMwy4BVgc6CPsDY4Mrde2lU=;
        b=2LoSM3OlgwTv5KR3AMqXvpW+qolPfaE5/aMjw0P9ro282VvzMf0rzJXT2tcD/XdWrF
         Mslxky7y38KPA94FOxzhQIwKQYI32ud3hgDVTx2Z9bXsRzQK3diJSUWPOjtGRfL12STp
         CH23mLq6Ds+Tgpdnyeuwvkw7b4zh66we0t8XPbB48KiAOujBNSrx1PK0JVDz7eyRneo7
         MAWJR1gGxhqb0NiOujf7zE6w/LzxueYgSBdubNJo0WMcOsnfLlGRL9diK6Rk7V2CqOdK
         N7IrpAq9df3sFL5UCxAFFYzRSCT7VGpdrzMyYvGCW8B2PMcMn2waC7G+XTMeqj/UdzDh
         tgwA==
X-Forwarded-Encrypted: i=1; AL+hErEn85gfrGvHee+dxcZj1I45T4bMyo6JiyHIm59WBsU5KTuplwAKL1Otje8e+EjazbTePzFbYaE+tWJ1BPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XjMzG9e/4DEP6RRYdzk91PPNzmCqY2YCQxHkm31fuMOX2HJeP
	BA35CKk4/yy9qMnC5v7EB4w+iRj1D20CjrAynJMkuuqx5AQyR1Dp80mB
X-Gm-Gg: AZFdTZe574Mhqt24f96JjkIwLTChn8VXrQ2Rdva7uvqsISEiOKx5cpfXbkPEL+skx9e
	rFzeBDgaigiJILDCUmIauCPQG9/63nsXORV7P45fQnRLXnvNXw/l1POOl/ACiPFETOmGwxs3UrC
	EvGcOsQ/F54+3vRsYpyLcI96JTujom21KozjWzXrdDARJTkeDalusQqlg9t0V6XHyuNHf9Si43u
	39PA+tFGnTfav2eFYQ6Df5ZTmW5tR+AjXpkFrYKKxKsWO5qNnfS7mpNMj7awCgR5KzPXIPV8DCE
	ODFOIjDzqixcvArJTVOl6l/TEYkuOjvzpaZXFnD4pP3t5npOow6wGrtxjdEvczor0gQKudwXbKv
	gcYbigX7y+iOiq5V2uSuyK2Xs1fAZZOR1YEXbV+0XdzCSH5Y8k0HCyfaR8kNO1GhryWUsAhvFAH
	cnVs/VYiTEhl5quIFR2LyDk1MC1HiZFrc8Cra2J/iP+W3LLWKqkPn0m+dGj+H3CjOAevDs3YdHA
	M1GJC4IZ7hN26SNR+WMvBxQPeGK8XUlO1O36l2FXYjIrCcVwFw6p6axUp42CKRleDeM0aN0sebq
	TOY/03OTCLJpv6iwXc40GYvMLFUS3OEG1aGYFVYnWILSueetPy6Z2B4=
X-Received: by 2002:a05:6214:262e:b0:91c:7c53:152d with SMTP id 6a1803df08f44-92114dd31d4mr7334636d6.29.1794949039986;
        Tue, 17 Nov 2026 12:57:19 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d70c5csm3329646d6.31.2026.11.17.12.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 12:57:19 -0800 (PST)
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
Date: Tue, 17 Nov 2026 15:57:17 -0500
Message-Id: <DMXSBWB0425F.1NVVQK5JZ4IIW@gmail.com>
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Decotigny" <decot@google.com>, "Madhu Chittim" <madhu.chittim@intel.com>,
 "Emil Tantilov" <emil.s.tantilov@intel.com>, "Sridhar Samudrala"
 <sridhar.samudrala@intel.com>, "Brian Vazquez" <brianvv@google.com>, "Li
 Li" <boolli@google.com>, "Alexander Lobakin"
 <aleksander.lobakin@intel.com>, "Daniel Zahka" <daniel.zahka@gmail.com>,
 "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>, "Kees Cook"
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH iwl-next 08/15] idpf: psp: add support for psp rx key
 allocation
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Stan Iliev" <stani@google.com>, "Tony Nguyen"
 <anthony.l.nguyen@intel.com>, "Przemek Kitszel"
 <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 <intel-wired-lan@lists.osuosl.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261117145522.1910636-1-stani@google.com>
 <20261117145522.1910636-9-stani@google.com>
In-Reply-To: <20261117145522.1910636-9-stani@google.com>

On Tue Nov 17, 2026 at 9:55 AM EST, Stan Iliev wrote:
> Add support for allocating PSP RX keys on demand:
> - Introduce VIRTCHNL2_OP_PSP_ALLOCATE_KEYS (560),
>   enum virtchnl2_psp_allocate_response_flags,
>   struct virtchnl2_psp_allocate_keys_request/_response and
>   struct virtchnl2_allocate_psp_key_v0/_v1.
> - Implement idpf_send_allocate_psp_key(), which allocates one V0 RX
>   key with a synchronous request, validates the reply (key type,
>   keys_size_bytes, length, and an SPI with a key ID, which the PSP core
>   requires) and wipes the key from the mailbox buffer. The key, its SPI
>   and its master key generation are returned in struct idpf_psp_rx_key.
> - Implement the rx_spi_alloc PSP device op. It gets the adapter from
>   the netdev of the PSP device, as the vports can be freed while the
>   PSP device is registered.
> - Keep a copy of the vport ID in adapter->psp.vport_id, for the same
>   reason.
> - Wipe the RX keys of late replies, which libie passes to
>   idpf_recv_event_msg() after the request timed out.
>
> Signed-off-by: Stan Iliev <stani@google.com>
> ---

[...]

> +int idpf_send_allocate_psp_key(struct idpf_adapter *adapter,
> +			       struct idpf_psp_rx_key *key)
> +{
> +	struct libie_ctlq_xn_send_params xn_params =3D {
> +		.chnl_opcode	=3D VIRTCHNL2_OP_PSP_ALLOCATE_KEYS,
> +		.timeout_ms	=3D IDPF_VC_XN_DEFAULT_TIMEOUT_MSEC,
> +	};
> +	const struct virtchnl2_psp_allocate_keys_response *vc_reply;
> +	struct virtchnl2_psp_allocate_keys_request key_req =3D { };
> +	const struct virtchnl2_allocate_psp_key_v0 *v0_key;
> +	size_t reply_sz;
> +	u32 spi;
> +	int err;
> +
> +	BUILD_BUG_ON(sizeof(key->key) !=3D sizeof(v0_key->v0_key));
> +
> +	key_req.vport_id =3D cpu_to_le32(READ_ONCE(adapter->psp.vport_id));
> +	key_req.num_keys =3D cpu_to_le32(1);
> +	key_req.key_type =3D VIRTCHNL2_PSP_KEY_TYPE_V0;
> +	/* key_req.domain stays zeroed: VIRTCHNL2_PSP_DOMAIN_NONE */
> +
> +	err =3D idpf_send_mb_msg_stack(adapter, &xn_params, &key_req);
> +	if (err)
> +		return err;
> +
> +	reply_sz =3D xn_params.recv_mem.iov_len;
> +	vc_reply =3D xn_params.recv_mem.iov_base;
> +	if (reply_sz < sizeof(*vc_reply) + sizeof(*v0_key) ||
> +	    vc_reply->key_type !=3D VIRTCHNL2_PSP_KEY_TYPE_V0 ||
> +	    le32_to_cpu(vc_reply->keys_size_bytes) !=3D sizeof(*v0_key)) {
> +		net_warn_ratelimited("%s: invalid reply of %zu bytes\n",
> +				     __func__, reply_sz);
> +		err =3D -EIO;
> +		goto release_rx;
> +	}
> +
> +	v0_key =3D (const struct virtchnl2_allocate_psp_key_v0 *)vc_reply->keys=
;
> +	spi =3D le32_to_cpu(v0_key->spi);
> +	if (!(spi & PSP_SPI_KEY_ID)) {
> +		net_warn_ratelimited("%s: invalid SPI %#x\n", __func__, spi);
> +		err =3D -EIO;

nit: seems a bit defensive not to trust the fw to provide a valid SPI.
No issues with keeping it around though.=20

> +		goto release_rx;
> +	}
> +
> +	key->spi =3D cpu_to_be32(spi);
> +	key->generation =3D le32_to_cpu(vc_reply->master_key_generation);
> +	memcpy(key->key, v0_key->v0_key, sizeof(key->key));
> +	atomic_inc(&adapter->psp.keys_allocated);
> +
> +release_rx:
> +	/* Don't leave the RX key in the recycled mailbox buffer */
> +	memzero_explicit(xn_params.recv_mem.iov_base, reply_sz);
> +	libie_ctlq_release_rx_buf(&xn_params.recv_mem);
> +	return err;
> +}
> +
