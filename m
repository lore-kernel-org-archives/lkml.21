Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105927;
	b=JZof0qqlWCOF4518e3Xs1raE2Fa+wduNwAV4M3ZZNqVte2uKF4s8krYhDwCj67+Bslev
	 1h6+z1sWBYd5s2eunlKXI5CTnELmo+bDV/a8kEyqdDmBZ8pGuT1HVqOvtfzVKrmT0F//g
	 EdxxYov+2hsxFD3PBaomKTi5nZD8EL5RHHCROBA8bccD//r+rIrEoqNFBV7+DLAx/E4r+
	 emMz5Cig8zXjleDPse70oEM1tmnaWwt4l3iAfK5dS9r7ZPpxCIRWj/rSqF4qyEerqgA/Q
	 V21LX7jUDoLG93fMoe9OvcIsA5LGE7AU31y7Lk33aXQxR9wLXztTilaVLUTjvWyP7qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=sPfYIUokIobAVOy+Kt3MNId0nKysTKl6bqq2JLMUxOQ=;
	b=4iAH/YTFJ8WzpAQIEX51GzrCNidpKZdrWAQ9f4d72UCbxSA+o6zUGdv8e7HWm28+hOAN
	 ztOfnPxroI/lGy3003AFDZnKm+ufT+jGhhgnRCFbmkydXe+Yk1uA7eVyLjf6Zx1mv2oMT
	 hRZaZ6I235HNWyXVASpCTx1DPXspfGAateeyXu7TX4XItT00lIKEPlFjQVkg07RY/E6dr
	 LQRzml0GKCw1jwfYBQIhoa3JY4sHuL5XjC4L6d9dw6DVPcRe8F/nTgtlRCesVRgb5q7DN
	 r9JbRtM6U0dcRsX/y2ya6nL9pjMj0icDCh+GyrKHL1TP/yXi7JLSJNY8A5Ykwee6Inw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="So8z+vM/";
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812F2606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 812F2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=So8z+vM/
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50aaad19fbso286126866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795105925; x=1795710725; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sPfYIUokIobAVOy+Kt3MNId0nKysTKl6bqq2JLMUxOQ=;
        b=So8z+vM/8W1etK2lXhPLs68JSCWaVLPdSv50z1uEQnrt520rYGfTckmRLUQEJRABYs
         l60Q515EiyTXENaXCX/A8Q0B3ZCn1Ya6B4v/SGEdYmjEMdO8TJQqX31kPi7PfntHHGkq
         cw6ECr2Y8PYSNFqdXs4E4nkfvdSeVPKHoDiU1c2BTfw5bApc6BY8z2fEvldnKBFHRbNd
         JqcjIIPu6JHjutqlsxo5w0TE1traCJiet2ulVvpzHkK83kIk66S/WnBqFK+/PY8KIglL
         jgWmrgUDIV/j+jX3jEa/A6HxuHqtR0E6lvbg/uJ7Ur04QjNXyc7owkIz864Thfns+1Cg
         T3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795105925; x=1795710725;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPfYIUokIobAVOy+Kt3MNId0nKysTKl6bqq2JLMUxOQ=;
        b=CcYo/BpL60EqUuAbPs141tx5KSFKv36jx1C0iedhmXJFtONmSaf7Bg0vyld48Pbv3j
         BOlAnM4bEG70VdKG8QcfzoNn0k0MKkMOijyTUA+TUUffWjpmmmDuuvGqJckqUrVUb1zV
         NYauQprN1Bm8rNeYmbTAr9oSWWQ6p5Mjf7FRsuOw3Hy78svey+0PZEqQMTq1YMEhMDvx
         ea3E6EMTpVeq3nzHgg1CZFtTFxXRskg9k2+wPNo4OuEE2oKswZxR45M9a4gXSMfqCGy3
         QHLtyVUI40z3GGM38SMVJKoKB5gGokIXQZcNNV8W53JigUCjcAbpD6glcc8rs3kTr/3L
         noiw==
X-Forwarded-Encrypted: i=1; AL+hErFAtcmo06NeL6zh5ERFPAxHZ3rjFcfZ2B2RjbZ+ZX9IkGJomXc0HjcYWkCIEQW938ul2c/N2XSvdEWcMGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jpvh1UARTNQlraHttN1oo+Q61wNHT8Jt5PXi4GPT2CVHxJUln
	lI373Bsh+9Z5ReTTTmHJFd4DaFfv1wRfnO2539jgeaMO1e4aIWiDfiGVy3zqYm4jSsI=
X-Gm-Gg: AYBFou1axVEdvWQeIR3KjA1/Cigcfyo8Q5NLFKzhtyxguI4J2DnaDGrFac/NF0GoWQE
	qwmiGwNHmnjgltEOYmHep9DLSXsXza0Z+VeNayj9haOLnzRuRj1M0WM/pNZjkPvpx/EPiEf/gVV
	q8ypbxusrlLgsv3h+mQKRDUYAgamWd7jUjCjRn5KyTXeO/74tsCdW2lXnsCRAHoTXaW0ms2+6u9
	eO8zZsLoU88YfjUZd84+PHA0SYA21ww9IyU6A7Dk9UQ/XDmP02S5TkqEVcJxbwvBLcJJg50vog8
	f35gT5RS4003KlCPT7ygAhzTw+BRgXmX2stifdEcMpJoOpbBKUqczG4KhjIdJSvULN6hlA3rOwq
	iY+tzcmiFvgIjs6MFcKgIxUWn1xP8XNYNh2/jBHO0qIhyqRN/MhN6egDFPGsi+KSqoz9mvH0Rrb
	YRt2LBpm9zMs0DlMt/0P3iGR6k26mkzfiQGF2EcI1b24oejyPReacWJiW6yuiYpOi7U/8iiK8a8
	oFYOFjjclpheouiQsL2ASUU3wyRLrEyQ5FpsZ8Uw2etEskA6D6bQv/RuL+qOsrACxRG6EXWZxQi
	FpAUmWQqj9zUIHAmRr02C+oQ4u0vxeebw4KAVh5bOEEuPS/glGzJch2GldslSZqj0/n8+Ukneyz
	ujKhAjjlXNw0sc2azDmca75+gdDXQsL8l+HN3+HuhepOYqJyviAk=
X-Received: by 2002:a17:907:da02:b0:c2d:c247:5400 with SMTP id a640c23a62f3a-c513a8493eemr50358366b.27.1795105924717;
        Thu, 19 Nov 2026 08:32:04 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1? (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de. [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc42easm14164466b.60.2026.11.19.08.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 08:32:04 -0800 (PST)
Message-ID: <3b37565a-4dd7-454d-99b7-108b8e4e7133@suse.com>
Date: Thu, 19 Nov 2026 17:32:03 +0100
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
Subject: Re: [PATCH] tpm: xen-tpmfront: fix use-after-free in
 backend_changed()
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: shyckless@gmail.com, jgg@ziepe.ca, linux-kernel@vger.kernel.org,
 sstabellini@kernel.org, linux-integrity@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20261119-xen-tpmfront-v1-1-bfabbbed462a@gmail.com>
 <av8Tr2jTQaOBOEid@kernel.org> <8c988944-34e3-4fc9-a323-daca101c1bab@suse.com>
 <av8kIqYC04D5QdXf@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <av8kIqYC04D5QdXf@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rS9qJzvGq5TEYjY8RSxuDc5I"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rS9qJzvGq5TEYjY8RSxuDc5I
Content-Type: multipart/mixed; boundary="------------9iDCYuhIjWzTJQZqas7jrhKH";
 protected-headers="v1"; hp="clear"
Message-ID: <3b37565a-4dd7-454d-99b7-108b8e4e7133@suse.com>
Date: Thu, 19 Nov 2026 17:32:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tpm: xen-tpmfront: fix use-after-free in
 backend_changed()
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: shyckless@gmail.com, jgg@ziepe.ca, linux-kernel@vger.kernel.org,
 sstabellini@kernel.org, linux-integrity@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20261119-xen-tpmfront-v1-1-bfabbbed462a@gmail.com>
 <av8Tr2jTQaOBOEid@kernel.org> <8c988944-34e3-4fc9-a323-daca101c1bab@suse.com>
 <av8kIqYC04D5QdXf@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <av8kIqYC04D5QdXf@kernel.org>

--------------9iDCYuhIjWzTJQZqas7jrhKH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTEuMjYgMTc6MzAsIEphcmtrbyBTYWtraW5lbiB3cm90ZToNCj4gT24gVGh1LCBO
b3YgMTksIDIwMjYgYXQgMDQ6MzU6MDJQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToN
Cj4+IE9uIDE5LjExLjI2IDE2OjIwLCBKYXJra28gU2Fra2luZW4gd3JvdGU6DQo+Pj4gT24g
VGh1LCBOb3YgMTksIDIwMjYgYXQgMTE6MjA6MzNBTSArMDAwMCwgU3V5dWFuIFdhbmcgdmlh
IEI0IFJlbGF5IHdyb3RlOg0KPj4+PiBGcm9tOiBTdXl1YW4gV2FuZyA8c3RldmV3b25nQGh1
c3QuZWR1LmNuPg0KPj4+Pg0KPj4+PiBXaGVuIHRoZSBiYWNrZW5kIG1vdmVzIHRvIENsb3Np
bmcgb3IgQ2xvc2VkLCBiYWNrZW5kX2NoYW5nZWQoKQ0KPj4+PiB1bnJlZ2lzdGVycyB0aGUg
ZGV2aWNlIGFuZCB0aGVuIGtlZXBzIHVzaW5nIGl0Og0KPj4+Pg0KPj4+PiAJZGV2aWNlX3Vu
cmVnaXN0ZXIoJmRldi0+ZGV2KTsNCj4+Pj4gCXhlbmJ1c19mcm9udGVuZF9jbG9zZWQoZGV2
KTsNCj4+Pj4NCj4+Pj4gVGhlIHhlbmJ1cyB3YXRjaCBjYWxsYmFjayB0aGF0IGNhbGxzIGJh
Y2tlbmRfY2hhbmdlZCgpIGRvZXMgbm90IGhvbGQgYQ0KPj4+PiByZWZlcmVuY2UgdG8gdGhl
IGRldmljZS4gVGhlIHRwbV9jaGlwIHJlZ2lzdGVyZWQgYnkgeGVuLXRwbWZyb250IGhhcyBk
ZXYNCj4+Pj4gYXMgaXRzIHBhcmVudCBhbmQgaG9sZHMgYSByZWZlcmVuY2UgdG8gaXQsIGJ1
dCB0cG1mcm9udF9yZW1vdmUoKSBkcm9wcw0KPj4+PiB0aGF0IHJlZmVyZW5jZSB3aGVuIGl0
IHVucmVnaXN0ZXJzIHRoZSBjaGlwLiBTbyBkZXZpY2VfdW5yZWdpc3RlcigpIGNhbg0KPj4+
PiByZWxlYXNlIHRoZSBsYXN0IHJlZmVyZW5jZSBhbmQgZnJlZSB0aGUgeGVuYnVzX2Rldmlj
ZSwgYW5kDQo+Pj4+IHhlbmJ1c19mcm9udGVuZF9jbG9zZWQoZGV2KSB0aGVuIGFjY2Vzc2Vz
IGZyZWVkIG1lbW9yeS4NCj4+Pj4NCj4+Pj4gVGFrZSBhIHRlbXBvcmFyeSByZWZlcmVuY2Ug
YmVmb3JlIHVucmVnaXN0ZXJpbmcgYW5kIGRyb3AgaXQgYWZ0ZXINCj4+Pj4geGVuYnVzX2Zy
b250ZW5kX2Nsb3NlZCgpLiBUaGlzIGtlZXBzIGRldiBhbGl2ZSBmb3IgdGhlIGxhc3QgYWNj
ZXNzIGFuZA0KPj4+PiBrZWVwcyB0aGUgZXhpc3Rpbmcgb3JkZXIsIGluIHdoaWNoIFRQTSBv
cGVyYXRpb25zIGFyZSBzdG9wcGVkIGJlZm9yZQ0KPj4+PiB0aGUgZnJvbnRlbmQgaXMgbWFy
a2VkIENsb3NlZC4NCj4+Pj4NCj4+Pj4gRm91bmQgd2l0aCBhIHN0YXRpYyBhbmFseXNpcyB0
b29sIGFuZCBjaGVja2VkIGJ5IGhhbmQuDQo+Pj4+DQo+Pj4+IEZpeGVzOiBlMjY4Mzk1N2Zi
MjYgKCJkcml2ZXJzL3RwbTogYWRkIHhlbiB0cG1mcm9udCBpbnRlcmZhY2UiKQ0KPj4+PiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPj4+PiBDby1kZXZlbG9wZWQtYnk6IEthaXh1
YW4gTGkgPGthaXh1YW4ubGlAbnR1LmVkdS5zZz4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogS2Fp
eHVhbiBMaSA8a2FpeHVhbi5saUBudHUuZWR1LnNnPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBT
dXl1YW4gV2FuZyA8c3RldmV3b25nQGh1c3QuZWR1LmNuPg0KPj4+PiAtLS0NCj4+Pj4gQ29t
cGlsZSB0ZXN0ZWQgb24geDg2XzY0IChXPTEsIG5vIG5ldyB3YXJuaW5ncykuIE5vdCBydW4g
d2l0aCBhIFhlbiB2VFBNDQo+Pj4+IGJhY2tlbmQuDQo+Pj4+IC0tLQ0KPj4+PiAgICBkcml2
ZXJzL2NoYXIvdHBtL3hlbi10cG1mcm9udC5jIHwgMyArKysNCj4+Pj4gICAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jaGFyL3RwbS94ZW4tdHBtZnJvbnQuYyBiL2RyaXZlcnMvY2hhci90cG0veGVuLXRwbWZy
b250LmMNCj4+Pj4gaW5kZXggM2MwY2NlNTdjNGFlLi4xYmU5MjVjY2E1MzUgMTAwNjQ0DQo+
Pj4+IC0tLSBhL2RyaXZlcnMvY2hhci90cG0veGVuLXRwbWZyb250LmMNCj4+Pj4gKysrIGIv
ZHJpdmVycy9jaGFyL3RwbS94ZW4tdHBtZnJvbnQuYw0KPj4+PiBAQCAtMzk3LDggKzM5Nywx
MSBAQCBzdGF0aWMgdm9pZCBiYWNrZW5kX2NoYW5nZWQoc3RydWN0IHhlbmJ1c19kZXZpY2Ug
KmRldiwNCj4+Pj4gICAgCWNhc2UgWGVuYnVzU3RhdGVDbG9zaW5nOg0KPj4+PiAgICAJY2Fz
ZSBYZW5idXNTdGF0ZUNsb3NlZDoNCj4+Pj4gKwkJLyogZGV2aWNlX3VucmVnaXN0ZXIoKSBj
YW4gZHJvcCB0aGUgbGFzdCByZWZlcmVuY2UgdG8gZGV2ICovDQo+Pj4+ICsJCWdldF9kZXZp
Y2UoJmRldi0+ZGV2KTsNCj4+Pj4gICAgCQlkZXZpY2VfdW5yZWdpc3RlcigmZGV2LT5kZXYp
Ow0KPj4+PiAgICAJCXhlbmJ1c19mcm9udGVuZF9jbG9zZWQoZGV2KTsNCj4+Pj4gKwkJcHV0
X2RldmljZSgmZGV2LT5kZXYpOw0KPj4+DQo+Pj4gTm90IGEgTkFLIGJ1dCBtYWtlcyBtZSB3
b25kZXIgd2h5IHRoaXMgaGFzIG5vdCBoaXQgdGhlIHdhbGwgZXZlci4NCj4+Pg0KPj4+IEku
ZS4gImZlZWxpbmcgY29uZnVzZWQiLg0KPj4gSXMgdGhlcmUgYW55IHZ0cG0gYmFja2VuZCBv
dGhlciB0aGFuIHRoZSBzdHViZG9tIGJhc2VkIG9uZT8NCj4+DQo+PiBJZiBub3QsIHRoZW4g
aXQgaXMgcXVpdGUgZWFzeTogdGhpcyBiYWNrZW5kIG5ldmVyIHN3aXRjaGVzIHN0YXRlIHRv
DQo+PiBYZW5idXNTdGF0ZUNsb3Npbmcgb3IgWGVuYnVzU3RhdGVDbG9zZWQuDQo+Pg0KPj4N
Cj4+IEp1ZXJnZW4NCj4gDQo+IFNob3VsZCBpdCBiZSByZW1vdmVkIHVzZSB0aGUgZGVmYXVs
dC1mYWxsYmFjaz8NCkkgZG9uJ3QgdGhpbmsgc28uDQoNClRoZXJlIG1pZ2h0IGJlIG90aGVy
IGJhY2tlbmRzIGluIGZ1dHVyZSwgc28gZm9sbG93aW5nIHRoZSBub3JtYWwgWGVuIFBWLWRl
dmljZQ0Kc3RhdGUgbWFjaGluZSBzaG91bGQgYmUga2VwdC4NCg0KDQpKdWVyZ2VuDQo=

--------------9iDCYuhIjWzTJQZqas7jrhKH--

--------------rS9qJzvGq5TEYjY8RSxuDc5I
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr/JIMFAwAAAAAACgkQsN6d1ii/Ey9N
2gf+Pao/6gxwMq53WtLQZGg0rt7LxQlMzgUrZUfCvGwBnRWijzoAdOuCktBwjdhIa/kDFtI+0UD1
zJC4DVDWOGZJ34dbA4adOwTpBx1BagvWrbZpOtxjJMAGug1OF+Bl5CtpD278hS4Da9vkVjvUTo+D
xdfJydn03dgIJqA8C5jERa0WvRfhFqeQi6fgXWWcV80qGa/fY8De0A+2eUEVly/S++3gtYbJ0vFk
DCUis3njGMqm2Ls7y2Xi9wm7As7lA2FCDvzK+G7xNgew1gYqL+R1g+Zp19YckJyAo5WNTOGE3LMg
C6iyQ06fJF71R/Afgc1XzaLmlZrOBWyv3i1NNAzKLw==
=97I1
-----END PGP SIGNATURE-----

--------------rS9qJzvGq5TEYjY8RSxuDc5I--
