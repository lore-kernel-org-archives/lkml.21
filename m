Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953710;
	b=IrDWsiQQqn9N9AgS6MpFTaQ0S2MAHOVsiFN8JwZnRM/Z9/IZAONg6VAFiMs+MnObCVCz
	 V1BqluzhBsr7NRcHJN2fJyKezCsgRx6Nng93lAa60kTLKA7ti4qRFubWV44A+Bw33UTOh
	 WuFtFKvXT7euHR3QS0xgD4LM5w6n9pCqTVKZ294J74158ylsYwIMa7Fo9pNSRHeD1uD4C
	 +atwI9uLUDCHBdzmWM5ZzwsZnxlmLEawxyiuWrorVCJ8xtD19clbUEeXaadI3Xvk3enKh
	 A4TmYMziWnzfVNRWydBY/ye7zSmOhGKqa/TO2Fcnpl006n4DBox7wlibgHxr0JsA5lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=8igbL3DrmgjB8f+3uFsYWHUjBeZpK0nAdLK0B3NxyZE=;
	b=2D/xTCKJ1oC/bc67pM7pJ23pJRZuKNc2IYqgh6p5KVNA5tqo58JL3XSMRtSrUvqAbONu
	 CQbzAJWA3Ys5khvbf5Hnm4sTmI6um1mgxhIuA3sFpLH5plw6AeTXykpNH9bNj4S0Wfp25
	 DNuFLm0ruMMXOmznPTwqCy8wqDRbnCQDRyf1AutY+m16XwlqvWRrz8xfF/rRB0VPJdeus
	 JkiLxw9L/h9Mtn4FjIzFsb3VxSzlgO9ByZmVOBW7MdOKxzJjErVav0nbLAqAKHKPrMR3o
	 4EXBfmvzRjb1wr3O3NkjOqodn6P1ZD8QA1n1chpXJ/YjQFcfAV/Rlj//zbpztWFdm8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Omz6m5sE;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55421606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55421606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Omz6m5sE
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91eb449364cso2008706d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953709; x=1795558509; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8igbL3DrmgjB8f+3uFsYWHUjBeZpK0nAdLK0B3NxyZE=;
        b=Omz6m5sEdcCo6i+rZhY1yYYjJkJ14J3/ehViGl2tfjKF8iKEXM6zW6OcK01d0pvglQ
         /FyWYDd3s9dTK874m371PT9CPkHc8iiyhftD6T3ezaFb/DKKKdfmKq8+1bbBRWF2f59r
         pPx0POo1MPsFAIzd4H2wfPc3JPhFi1cneOymArj+Nb7qd6SedaCUb+I0aF3LIjuWBWiC
         0hhANseDZJJQl3514kujAp1eUbsyHKXvuoKsCflx/Akjgi0B/tlwc5X5HqqoixQSbJQe
         qatcOfCVlvQrT6KKtTYaiM1cyk0aObDlkWtUfL4ACKut8n/uzQdXMiEHSkUPiEYiqVTv
         sYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953709; x=1795558509;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8igbL3DrmgjB8f+3uFsYWHUjBeZpK0nAdLK0B3NxyZE=;
        b=sn89bVo3lZ3n3z1N302lBYvt1e/NYVgHR0WolN5nQlQpwXYNVj856i/Kcvz6va6Mhc
         munuHyx4OXXkXYqYJ9euNDAReqkYhoQWwiRsxNdo4guZiddADyENaTY6jZhGAXhST3T4
         11ULAJmMMz7vuV3iFXyrDmL5v1bBUtBsvmMHTPu+WEA89eDEpa25nDgUgNap3BGxx+23
         DaVoojkI89DfvEVzGma+Zu1byb8rMBzLQaABbC37EbATc2kS5j7C8vK743qEMOtJtA5E
         uf+bm0tB37guCPHZjgCzpRWsRFnYtVEb8VFtmLHz4jAvq8Sn3ZGwEZ3MXdMnhBgalZD0
         BcdA==
X-Forwarded-Encrypted: i=1; AL+hErFqcxdXsP0conSN3vjFbNxxMOpEgeU106dmPFNUIvFGTJn2jV0pDp1b+c453pH3ciTMN7a6l0OtZt/sw+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sESrpEsaag4FbcMGOggxObKCsjnBOg5HNALrZPyG3R+4KZc8z
	2z79j/7ipHkZEidbH7vjr997kPLyFzMVht/oB6v6OEfZls/S3yNll170
X-Gm-Gg: AYBFou3nB5hGl8KOsTUi/MBFB0ocsI9p+OGuN6lVJyhmJ7UEjCl8Xv0F17AtnlIZUSU
	aliiUzlAN+kNZC5JNIys6jmEipBhuwum8upu7kH7ktr6H+73DMJbv0uRgGZwIDtjSDiXJFN8oIA
	7166djNqnfmtwBokseTH8IeTA4mGHytln5ALKiFEmd4SI5b8AD/Fp+snOqzNKKF65F2pMRwdrV1
	1E+nvBdgb/Gp/QkCG/3IGcjVHe9DwB0tnG4prU4XUhbLOOnbYDuHCjJX64FkTDAA33doERkO1R3
	ZoKCodhj7qC9D/O3C6xRJrjZDFxUDfm12yzctBXDYpFDBX8yMUeMc2Ixqrt5SduBchNTHspxWG6
	GIISvS3xNkcTzT1AR/9ZL0RGLlO+E+C/d1jpTp/K6KRnBK3G3ryX1Y1uDbadTOPyXmu4WQeQdQ7
	/STzYxRbJVTChOgCvdSQyxw7wcsV5UEyagUvIa6PrezHsKzoL33Sm9C6bz1gNoAcp+Xddic5aKh
	xeoUi20nx3r6E9U1HmRUZF/Mpf519xFKU9C7neHAK8/32Y+q/KulIoNxdMHyOgZFEQgw9lPRTM9
	wIUCheK2/ujzEeXmm3sGs6/wpP8FXOWYBg==
X-Received: by 2002:a05:622a:307:b0:55d:1db7:3ef4 with SMTP id d75a77b69052e-55d5a5b77b2mr12272421cf.41.1794953708820;
        Tue, 17 Nov 2026 14:15:08 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d53b7fsm4789176d6.26.2026.11.17.14.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 14:15:08 -0800 (PST)
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
Date: Tue, 17 Nov 2026 17:15:07 -0500
Message-Id: <DMXTZHJA6OGI.3RFGSK5SE9RUF@gmail.com>
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Decotigny" <decot@google.com>, "Madhu Chittim" <madhu.chittim@intel.com>,
 "Emil Tantilov" <emil.s.tantilov@intel.com>, "Sridhar Samudrala"
 <sridhar.samudrala@intel.com>, "Brian Vazquez" <brianvv@google.com>, "Li
 Li" <boolli@google.com>, "Alexander Lobakin"
 <aleksander.lobakin@intel.com>, "Daniel Zahka" <daniel.zahka@gmail.com>,
 "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>, "Kees Cook"
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH iwl-next 09/15] idpf: psp: add support for psp key
 rotation
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Stan Iliev" <stani@google.com>, "Tony Nguyen"
 <anthony.l.nguyen@intel.com>, "Przemek Kitszel"
 <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 <intel-wired-lan@lists.osuosl.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261117145522.1910636-1-stani@google.com>
 <20261117145522.1910636-10-stani@google.com>
In-Reply-To: <20261117145522.1910636-10-stani@google.com>

On Tue Nov 17, 2026 at 9:55 AM EST, Stan Iliev wrote:
> Add support for PSP master key rotation:
> - Introduce VIRTCHNL2_OP_PSP_ROTATE_KEYGEN_REQUEST (563),
>   struct virtchnl2_psp_rotate_keygen_request/_response,
>   VIRTCHNL2_EVENT_PSP_ROTATE_KEY (4) and
>   struct virtchnl2_psp_rotation_event/_data.
> - Implement the key_rotate PSP device op with
>   idpf_psp_rotation_request(), which fails with -EOPNOTSUPP if
>   VIRTCHNL2_CAP_PSP_REQUEST_ROTATION was not granted. The PSP core
>   increments the PSP device generation before calling the op and
>   doesn't restore it if the op fails: the op restores it then.
> - Track the master key of the allocated RX SPIs, to report their
>   generation on receive in a later patch: bit 31 of an SPI selects one
>   of the two master keys of the CP, and the CP master key generation
>   of the allocation tells when a master key was replaced. The packets
>   of a master key get the PSP device generation that was current when
>   its first SPI was allocated, which is the generation of the
>   associations using it. Associations then survive one rotation, as the
>   PSP core expects.
> - Handle VIRTCHNL2_EVENT_PSP_ROTATE_KEY in idpf_recv_event_msg() with
>   idpf_psp_rotation_event(), which logs the new master key generation.
>   The PSP core can't be told about rotations it didn't request, like
>   in mlx5: document the limitation and a possible solution.
>
> Signed-off-by: Stan Iliev <stani@google.com>
> ---

[...]

> +/**
> + * idpf_psp_rx_gen_update - Track the master key of an allocated SPI
> + * @adapter: private data struct
> + * @psd: PSP device, locked
> + * @spi: SPI allocated by the CP
> + * @cp_gen: CP master key generation of @spi
> + *
> + * Bit 31 of an SPI selects one of the two master keys of the CP, a rota=
tion
> + * replaces the older one. The HW doesn't tell which master key decrypte=
d a
> + * packet: report the PSP device generation that was current when the fi=
rst
> + * SPI of the master key was allocated, which is the generation of the
> + * associations using it, see idpf_psp_rx_process_skb(). The CP master k=
ey
> + * generation tells when a master key was replaced, including by a rotat=
ion
> + * the PSP core didn't request, see idpf_psp_rotation_event().
> + */
> +static void idpf_psp_rx_gen_update(struct idpf_adapter *adapter,
> +				   struct psp_dev *psd, __be32 spi, u32 cp_gen)
> +{
> +	struct idpf_psp_rx_gen *rx_gen;
> +
> +	lockdep_assert_held(&psd->lock);
> +
> +	rx_gen =3D &adapter->psp.rx_gen[be32_to_cpu(spi) >> 31];
> +	if (rx_gen->gen !=3D IDPF_PSP_GEN_UNKNOWN && rx_gen->cp_gen =3D=3D cp_g=
en)
> +		return;
> +
> +	rx_gen->cp_gen =3D cp_gen;
> +	WRITE_ONCE(rx_gen->gen, psd->generation);

WRITE_ONCE isn't paired here. I'm guessing the Rx code in series 2 will
copy rx_gen->gen into the psp skb extension, but that would likely not
be correct. The generation field in the extension should be copied from
Rx completion metadata. If such a descriptor field doesn't exist, then
the key_rotate() implementation might as well pin psd->generation =3D 0
like mlx5 does.

> +}
> +
