Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881498;
	b=VFw35fK8mVYZy4IMC/r/93Oj+ADqIdhpNUiqa+HbevdMjGfNvGS4qoOsuvjtDtLpKk4n
	 RD3oL0OhU07c87iK3TTM1L81BqPksiZo37c66FXz5JBp0X5DKNZU5WKBAwO6gY3B8ymnG
	 UIStBKU12eO1JZ1oUyQFNw8DrqJ/R9pcvD7I3wD7JCJKOzksHBSSmfbEUTLOYZvxaCnOo
	 cZXCjY8RQyo15w4xkl3mU1UmG9ZsBPPIn8U9ySHovNggLBCixznE18vZJ9GdvD3XdIRQf
	 RaRpiZXsazXY3T7y6KElojYLjMTrrcamdRrW6mvyptoXANrlmlIAfjrjm0OfuhT9e+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881498;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=aBpSRTzRtZLA7rSrCM2ZtPpbQyLYgMRUQ8NlbRihjn0=;
	b=l+5RSqVcoSLeSSP7kAgxJNCZX/qxlCwvkxH1/UuP0QbRhE8IDGslGIMxj8XSdj20kcIL
	 I/sPkvSO5XgdpfGBCEBauPSpiy55PXOGBgs7KLc9Ge1Vd12lTf1NET1gvdTep3ttdofEP
	 RMsJH/9qQ9OsQYvznehLA/mM9EJdkLDrKeW88nkaJdeyQnCHPMpBL8Psn1iw+I6L4mZGT
	 aDrtc1Xeon15YwiCaUOYtHLGpE7OUwKN6NpOLODy+QfEZKvpJaghyNRr4S9ANbKq8JJm1
	 Gq8W8hoJoRjE7YQzG7Sb7uii6UcGb417nFbQwUGGkO1dAFBxz8k8dqrELi/KKnfQuWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=sO928kBm;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF79606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 15:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DF79606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=sO928kBm
DKIM2-Signature:  i=1; m=1; t=1795881495;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:BOfsYMiNVU3LNLsHrght9mz+iQDd
   bc1kxY1nr0BgPTs9spVB5oXU8GFdkLjjLQIajt7JjLtg4xVWgMsDU8dZ8R28lcnfMblsIiKnoLP
   DdDK76gpRdgsUeCJzfdUoMnwXRMU2MltvJYWypL0CYsHTzmoHcDw/n33KbleaeGEAq7saJGAKtn
   YrmvFbJ+8kKvVHEjWVS6tBl/LRoYciOp24nRDsUjYYUXzgcyN0WZDbyfl2G44IigclnLTz472rA
   14FcmknkcvNyWvJD5/Uz2dKJKLF1yePHJxC5n5juA8m1RDSmNQtaenO0dR+FLXmkQ4dM6InKCFU
   l7hxP+JNPFFmUA==;
Message-Instance:  m=1;
 h=sha256:
   /5w37pfeBiPQkDZV33A4wJGx4fGYUoFY1TWl53k3dws=:
   p1EcqDoCA5/qa6S0Zzn6c152PKNMyZp40j2S3u7qOjk=,
  sha512:
   8/LIUSdsWvP6e3fSvI0xIQchZou7Mu56T6aziRqcEth+rgBsAJ04lyG7FNq+t6tcANUtDWY9KRKeVdneTvx/Hg==:
   +XYvl46CBneucIR2YjRaeyriOliKKBAwyBgBZLIf9PSHxuvBHywT2ofUSak/FGTONsIteiT92FtLoNuBBkvfnw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795881458; x=1796486258; i=w_armin@gmx.de;
	bh=aBpSRTzRtZLA7rSrCM2ZtPpbQyLYgMRUQ8NlbRihjn0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=sO928kBm+ESLwa2hIZvZ2KINO0uPdJ/5bPNKb+SlPm66oDBU/PB527B5Gp8d8519
	 0kjThYM7Dln+0bBq2mwGsKRDGZw9Bzs4shYF3FGCGIZjXUfZmKpdaySa9jxxbAIq+
	 cthXn3UC8DKbHroKG36cNya3BDM15ZP9jp4DG6njWBh5BcSyc1bVnzM9TeYYUpX4C
	 zqOflGbw5lewmSSW5V8jvUhAejNsHigXDC6zKyDyWP5JFalr5VlsP6iOxiPl5keMK
	 tR5Tw0hghZcvPcEmIgKelfNuCl5SD2XnqUEqgTFI7+N65gU/XU9o6uEoj13nBWpgj
	 vQavtdIYJYSaHMQjLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKm0-1xqUTw29U2-00R7bF; Sat, 28
 Nov 2026 16:57:38 +0100
Message-ID: <e622b541-49fd-48ce-87dd-62cb94f8f068@gmx.de>
Date: Sat, 28 Nov 2026 16:57:36 +0100
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
Subject: Re: [PATCH v2 3/4] rust: wmi: add Driver trait, Adapter and implement
 RegistrationOps
To: nick42d@gmail.com, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20261127-rust-wmi-v2-0-5bfafabd6a6e@gmail.com>
 <20261127-rust-wmi-v2-3-5bfafabd6a6e@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261127-rust-wmi-v2-3-5bfafabd6a6e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5qCCUbtCUS9xi5lhQnvjRQf/cTNHWPjpZIGsBIg9KekXy/venIs
 6DbwGHhyC9rqvPs26KPLQeQIxscE+1LuaAbKqGiDVG1JW94PDGK0i0zp5LN0yBJTBcP0Lof
 n6kQ9WhJ/3+rqMDKe5hr60OaljmmwHpPCF0B/hJfua6zDiySeRaJ1KwM0VBGa3MyZKs5Q4f
 OYCcvr8w2Uv2UYdM5VCbQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kxySkWsEmEg=;XmlmzLX4CzvjL3jbiRKK2hI+89s
 37wnmtt8SJaAJyt3HxaxY4uAMTXYYxjyF2+JUF6e0fRYf1mkKoBQ2LPQbAnT/kb4KEDBgYuLi
 nYwq4kvbPDd2j09ilyARFNXcT4yKk3QpVACbnToaKjOdsSjP6jZ6LJo7ISdva1Oy19YXM/jrc
 G0btV0WMSEoa4q4lM39vWCQBZz9lqLsAucBXxeyby9xWGUeV+i/iViO4M49GLH6i4A7la4jzg
 Rf7/oDDeIcTP4n/P7znmzD6lrwhdqknzLB7UslULXexQavPFQkMqOkdxscDpRmoMXzDJpn66g
 lUEw3Yu6xczxt0pw+xl6fG6f33yV0CRDv2WtacFZQldg8O3RBmgAMKWpJ22EM7iuxbSyDMlNi
 ecQwM0YsE2TpbCTgNttbw6kAy7LvJrig4GtSObq+deP2NK7f+XOyWStGMfX5A4xNUHRCEt2PC
 TLXGMyHAddTTmSU3i2W8VoWLosX0ksnKHebb1GcFHvEX6j6eb6euOUFNmbE4D80NFQOSna0ZV
 rcWnwojFkHd50AQZAd1/ce9QBl0Q+TRNG4JNl3K0/2VUOCayvrwbxVJdaPE2F1PlQ67xHgtx4
 UAbf0w5Gi/24SXEDHnwRW+X4ghJ9AOqzBIO2SJtDnhqq9JMldJgNYRzcDL3+Onv11Lo9IrWzp
 WjKjRtiU+zHZGgvDKLJccZcoh99bTrRG/nN3D0xlsKpUS2JF5UAeGwb0FESPYAfuf6KMT5o8B
 k91WUlvbaF3rUMgSrOv6qieiRZjrrZXIjcPAKICwMV5oFJrO8yZWWHqkMZ+gTI//IUnIXgBsH
 CbXDFFfx6Zz8Q187ApxKNOKOr/Sf/igsYuoyQ9wnh9zkXYw1p5Iv3YUGlF0MtkE1H5dXRBzj/
 g4WbvR3bqe6Yl+xPRZulrkzYr6qF8usS3sF1tyTWGQ5FCXzgK5NsxgJE/UdECG9r6k9vwL8S2
 F5mCvR8COhvhWKhukCxGeFAcwIK+03XfQql05WqLazv3GA671nrqudAltBvGE7NlGdtLxkZxD
 M+0gdK5wHtl0QrCQj2EuYyLYfEwXrBg+sWh6y53Ft/HnZdShOQ6GchN1kcDtj30LQsLnPNeDu
 9rS/PGzG+cerPpOIAcnK5yzN4u4QA4623fJ+Zvp/R/vQD6DJKDmmPc+HRXj77iG6VGwGoR6cQ
 Z+fwvMTLOrZ9RckgPWvwvl0yEe6iy+9SBRH51og25Lhr8jipLz3tSbUqENCUXYVCR0aiD3l3R
 ZO0//buNeE77GClO3BKtXI3Odz+nP6DnQ32yIQqiyGl77qpf+HAGNJGOIMguM9Z1sRK32KD/A
 yr2hI3Gq+Yqmylkxvgmy2pDNk8kTAiqiOlw2PvYtslj87iYMt9HbOHyiRQPA7p3axrL88bDhQ
 Lcw1fgvM3K0mgL9/NZdbuEUaI9mpwNaReO7gDN+sb3VP8Nh3UGqpbpf04FzINkEw+leJjWDbo
 +OqCu0B3CSiLEQjeBD5MYg6SMYVhKbTwy5batmxPyrHityOvthnViv0zVR1LYHF9q1gpq0emp
 DSr4X20mHurci69z5bulpa/whg300ZMR/tcB3vaMAdHqwa0VpAfTYx2KkIlmRNr8a1bUlnya+
 2Q/AWAMKvF2pYCducFM26RhBbFP/7hclmbMJyHynct6ZVAgQgsTyQi0oy8W0PWY3+vwwOD1Nb
 zwxhneuiZUWyuNjjutNQYpzWLxeHj0PgqbvOu65pLchEFfWic2O+U2lU4VxzFk7bVGlib4+8C
 kSgYBTyBzW0KKEURreRVJ02Nk2oOM2n7Sz3P2BS2UNyliQ+bNEeRfVacdFwfBG2klgA7FUhWG
 kIwqrbQvxxYhAunEz1pmOYPYGNWKmAR2KKAqBrQCdGJiuTQkhgnp2+DrnXrB8eK3OyK6SVCr3
 JGt6AMt6wejoMSTP1BPnF3iez1PgLNxAIHoQDeyisPABDa6X0Mc8Vb+GK2Y2RGA4YyM6/ec3b
 9gossxEeNwaW1Yz79fshpallQRFgHJvnqsxxY8j2Tq/6ihlkFR60AKbj0Mtz9wO/u/E2Va/MP
 l1So9nrqkvDih1U7d81CghvrxaF4LStsZAURoxUPdwlbssHU151ocxvhTL95DNJHOPZzZ8jxr
 uddp46Vn3h4j56pp+mfIN30Guq0NHihSVqRf9uSaO6hUHcI0jFE29DU+QWQ4OeUzQ+CKIfisC
 qxPo152w0T9sBEMR99hAUqsAfX1rygF7eagnsP51EJVd/DTf3Jc0lE4EI35chke/4zHKAyuUg
 0I3FiKSouGBTj8tw1ucljt9BYEqNf9jTNDvDpZVVqK2l5gy8ec1GvYKwlqaRmnhQc29rTjYlE
 5Y7ph85iJwcndp33Jisu9kmXFdB3FFiuEqr1wKrEGtXcdkTKa93jFcOgw3b6SCpnTv9IVsz5D
 uo9c9Ynu0GXcv2Vo/oKDQgMziXK2zI+9qcz6myhMsPAC6uERk1HQatZ1b2vf++jqEc/30k15y
 uMr2KGFyVaZdg051GcfNIY5HzCSuRGZHee+Mv8f0c7HYpu7JxTG4G0zmpXWiPjXO/b0rZqhqo
 5K+TqHbtGE+7rJKesnrSEM+/l+YM8lwXut/ggpid0jI1i3LsaiZbKDKZ8HUXrHSWayTyNTvTU
 jE2sCm0643p44WENDMWI0mRfDmPOCb238w/Sngadv9BwGR5Y9mNALzM/VWro/0hXjK0a8M+Cl
 Qch7yEXudz4BOM94mDm51XmjB8TroEkmF3Amn+u+DOX8jTCVlYllvhA+hi1ZX2uA+KT+K0w2/
 x+kuS8Ohy8VK+BE1yWW9MZQr+E9NWwICf+flMqqLUPqR4g4yttQhBvuh57AyxI7fQlijysfg8
 ZE1yDlZKv0ILeRhukcIjWiO8veUgxqxUz3t0vt2i7NoxtHufwgaSMJdxnW31tJHyG2wbn6xTo
 K+BEuXdK/ACFcSbEqNCxthRTbSW7SnalE/uOY4rI6fqOvuyhNtfkBkExmTGz7ArmIslUuFYLc
 MxrKHr9FAfk/dFuS1+hOmpCmPhZmwE2AzU/YoKFqFzDxGyb0Rpv6qMQrI2Rr2WN3DcM80gRj7
 sYU1eBoVjobbMiaXDvWvnAW5CCHx92YFCmjdB0nTZVuwi9QkP9mVh4MnbnchxF8V/K+mhW4HD
 UdpheTcb/3aZ3X01PLgsVlcLpxZrJNgEs4gk58UzU9FcYMVOq1v65YFHlUhE4r4HLZbaoeFxt
 vuNGgw0NebBUvS220HpKJW3r3GyF7LrhCU/qPvwIApuj9YPaJPTv8gJTpxC6e9+Bd4/puFeMD
 u8VEiYbda450q0DJMOb3SSdIt1rLWAdw/DFOeR866rFV68DRtmtbIDW0IyrFFlEfELgoLu+sr
 wjxt7sqN7PkWSgsg5qPen4k35TppYPbNeR9JSRqRd9WQcqaYxKLrphYv4mgyGyYWz5eXCuFEi
 NvXxp72wKu22KRhOXFlqwJYfS7/JPuu+1YooYGGw07Rq8M6h/RrxFGQvFnLRQ5lJPY42jm8ls
 AS0RmvbkerxiMGK7Ojqn63s+rhxcass3lZWkqn1YnjVDiFX4kKB0fYqq2be4MulCLv0Tf6R5c
 nsh5ft51wYNKH5b6RAJStPnt9Hw6gV2xRgrO1Nni+f2g0kJh0dgGGoyVvxo6+GxEkIEyhkWX5
 f59JsejDzs8kTT2R7FMG7BHShuzlIYzNT5962LwMkcfxcTyDW1oX4E97wHe3Zxbzzc/wHN9qC
 nWvXuM3TCHm47DKfpSY96Ti6x7sdXxobOMnwG28zHPeXwDMUboFVDSlc/JsAsnj6aCsctZO0U
 CS+lZRBWs5dVXBuBBmqGjlQmA/QjOZz37bTUPP3Im3DuAqnMSwn/r5d4EbxVD/TYFnG+6ReLt
 gtH5RNXh5wAokBHhk3DFWzXnGJU2ajzXJ0qozOqF1ldduY4MdjNvGn75iZt5QBsqPn9omiNwO
 Se1bDL3IEi4IMESye08BXRVgdBhDDMT5uxI6D1AkVrclC69Ls6gVbXRsUZuxr6OGUPugrK8uP
 GwLEys7jTDlVNr+o5sPKwzw2FWFg3njAL0J29l7F0z+P/QRLC3AzlD3/6JtjA0uFttyrff5/V
 TGY+Br7WyfvxiNxq3VWg7PLeHAWnfYDGlHWJwIc0nhlyrewCNeZKRUH1SKvXl+Oi0/4um/DAw
 8qEjuEgYO6RtYhoe9PPvPpIEODl2rNCy4Wdbz0Rb+HLSRW54AYx4oDrsIS8r+RAjcE1syfECO
 aH82inZZBgbVtBjlW0tJb8dCCP+RUeFG4w8kZ8PhP02jXRIRvtdD5ddR4AgwFObN0/J6rHGy9
 zXmMC/H4B7/uq45o4mzn4HVnVQ2n0kY2wtFFXW0C9X697T3qBs08xgNj0Exy7o5bH2kqJpTU4
 effcW8NdcsqI+D0QdILwQMVtsD/7ISPq3v4BJ+tyVYSqz7pr/ERvrs0/9O1gpeH1mNQs6yM1p
 9cgJM4ru7FceYdmT4pbW7Z3JkcO3ptfl/BeqfNTA2qYuqjX4T32mIqj9DaLoREQZjjM0wRVt/
 7cqjbwv3AZPjDNUpRWK7fIDG+nqtY0/IdUzvNxS7/LQgeI+kD+wsMZw4uciGGV+mhtELd8j6t
 zfcQE0mAoVBi8tZjh3YnK/A10Zp2P1ajMEIPBkKB7+ga+8x9rwuoUxrBN9ua8FldpKsY5eefF
 D2qUbjjQpuVHhE7p0Dsb8S4olBSVfOWBwKTcxOUw3eyNex5R4RcCCFEfFFWImZ7Dseol4kBDf
 aMW8uGzgvOlg1Lk9fbSWa7S0NTESoA0OtGGnZ6xr2PbHOPTxFIDvNQj35gar5WRR/UNLUa9F7
 IIKK7QwQegZqzDmOKHnLO1R/6bZdhM9qe4ir5SMCSznvqOwRNmWUpd3g2z6MKkF3AYkorSL9C
 2nAJ64AtetiVubnqROtZiCbPvnc+xjI+eVCjdrnX7Z7K8dQ5Zt1lesmAiWNdGmrv6OIIvTyU/
 K5+KDraTfee+LkDrTLGu0kIrWRvAWGGR9zX2tS3et2w7wc88+3/KEv710P4+yh9WCh1MZAGFY
 dD+x4xdcH4tmc0pUprZufirEIFJF+f1EkrOWS8ITmVP83MBPpNVDEDvfjk7Q9xeVX+3MvZAUC
 4K1JaKIIYhDguDvOnSJ8+Ej1fOmDoetIU6nk+nAfeyRX5RemYa8Ojd5cIeboQ1R9kLm2RedR7
 +O3L/CjnLgLM352wHfvu2q4wcP7FdVZOCpIui9TQP5Dah14w+MeRDa7DRl+H7rclu7xAuTJ+g
 rqQVhmAHjDL3/GpksCg7n7Z5ft2L6IBGwg9/zf/vI6ZG6wzNS756grP4tD/ElxIQFucJ+peqJ
 IF2JPPTAHxenSjY7a6Ypr3pMOyK+LsX5RAcIOrugSzQEcbH2YWZIIxr2N8YRSpsdEJWC5IfSB
 Ca9G06wQfaV6gxvyH5ryZUfQjnbD2ZThDMLqzMOoOfu8QRKUGKjTu4Brhv+phHp9kowTlt0Sf
 BmkKBOOAhTCD03jLyKAR+mDvJLmKC2v5aEtDoAvdKNWXj2xq1ug9XdhaZ+RESIdU1+sLBlPXk
 e3FWxDRsatfr1Jw9hExSH3cDsIK5ym8+o2KJzg8CdCg9LPDbDFP387yje9VM0SdgkBhppAjbb
 rfTIx0jgz2omTZn3U/xs+j4KvpL6tkFUlluU8FjAnCj8nQWEP00kdu3opAYlQjAD2kXXroPaS
 j2Aqe4scrIevbCc9O6mP8nHKCmp549EN+snOj8LCthaVYanRZOIZaCJg69v6nawI4JD3k1INM
 8kLUi1/zV8xREwYFunxEVGhsl3UptsgfvrA2TbIo2qVAZDIiU2c42Sf4dF68CBfv61WlZweBV
 5UCL9RAhw/GHNdIKxLyinle1zY0bcQwEpwKXssNA+vNS6Zt+TzoDyFeLcWnA3ce6vj7DkS/WL
 TVwEltDrpGhb3CJvChzdiJJRUwjmI9aZ8xr8Nj1EjPfNwN+7sRlRqGLWkn+7K4BnqDNIkBcLl
 4UcuWTA/gIKQ352KJwoj42W4tm9+y4CPgLZRl3WUR0p3FO1KI2zllc/VSZH1JMoDBdBjXNOlN
 kWqIijUbPgG4rRHWjUd9lc2hh8hM0oEfqdhN0mI9xzkzTPyXKlV2NkQWAREuNkGjP9YZpf8Xv
 U3mzrM7kAhqZTpiLg0pyvBw9DKlJfoHSrQ4sXjTVSWI9v1fhgRdpFjqhx0ZnSfR1dJ+179VTl
 p94/mjF2lcAfD+2f3lhu5ziAzldEL5R9h8g46YzETKbsF9a4HwZAh3g6+xy7TnSrJyHXr2gWo
 3yqTU8zus1Ajs3iSOSHYZowl3+CkzCnNYod5/+ie2y7ZLq72jKBk32ML2YAD22irQj/3Vi3Fa
 DG4dj7LNsU330gWvJ58b8c8wqBaHbjRBHuC0JHJxoqzimyzW4WwVafQns4/3u0hi/iJ55uS31
 VIRrYrwxd01no5lNqYmcu84jvGZpH4pYdPnZMDHHxaRT/ZH9XmxRoymkWiR3wLA5+3b9lr3qI
 Moiv0fcSzybDIG3WiloFOZdMxKd2BHegzTUAzQ8wOq5ie+t6rSGVRNBuQ+FKFqW9PG+RWcVIf
 AfbcRs/p0I8H9ed6aFY3lRQ7J7X0c8H5h5jEdy3rM3pZLeZPvc6iTwvgVuOlmSb/+uZ/gsmjc
 sOkK1baTy21MUA5Z+Jzu1hxYeuXv+JCDNxq0bwZSFcE+YavW570mIPgLsi3E9pqmUMZmqFt29
 KeHmtgD1UAVKPnWn5A069cDUdfIIwajcXjGk4dhoNZxtxZsaJxCh8XLmEz5lhGqTJ+rZdg2n3
 CLIqD3EPifSjn6NPsYxFQOpOQTmNxSi0zOle2rVSfFOuRomKrNqAikSXO3AwvYc6+cQ5Dyso4
 b7BC+BF7Q1dhYvxKp1DNtldQ6N5Iq/1D0+ILcR6cnP770Kz+hehTgEaGnSgkf8Nnc+KzNiORl
 d47hhCvx41eIveCF9+zZ3RGGKHpqLkYmQoHIe22EeCTEVNtwzH+iULqA4QBEyrT174Ya0+BCZ
 fhSgZun84DNds5PXyeRF3ZnEpkjlYAc27M5/41ZVTOOWrhcrG4VPPyv1RXYgbeqghlpKWdA0W
 4DsKj64jCrwHJBTiAdVkP7kj7DNON/BXj9u0UNIGoQr/b3gtbWbaA6w+2npW1DjGPGAZhi87B
 ZGdv8eyiZ8gBb9tquq+cjb3rakgd8SEbc1ScsQVXTfAyoywINewWxE6rgOizItpEiT4I5kTzM
 RNaYdk7+rSVRoF0/Elxq/BPeiTdtyDW3fNP9w2UOnjICfJvTM+lHvJK9N9/9Uek+J5qENl5EI
 x9mOHpbR1u6/rrekHNo5Vc/msx5/yJHmZFvNFJHEwH50kKaLXt0BVGpuLINs2qSVSuxFgC2GF
 BMdhyIFu0PrkM7XB12dat5t18QQQYzoTLJLnMvS1Q9l8eVcRGNe7BlasBG2wOs7f1imcVNp78
 r2pXnqJGqNnC8MThGRKZAvbBr6v6nBZoJ9QhIP9EuHUKyFYfj0BBvlUh+oLItmIb4zPHCmTRk
 6hqf7xg8yqCWNTIzIaTRQz5BExtVmSJOXo49JqSZdqQYyDzqTr11rsE9FWIyk6MCRWFBow9sF
 VyQxfEzki46Wt+rqhD4sjQ0/e32H+YXOxYnyVrAkPBsxc556VJLmslWxaz9nUEwdBZhEiUrBV
 urPzDnBn8mD/Ks6Owx3LlxK/rtYW/mahZVJoDEHvoAlj1BGGMptiQgnmDZmVinHs3yxHb/rCs
 AigKDf/bcjlVuu8CV2FziTWVwLWtIbqotOA/kAW7rrpFJX3HFQCreYewJgcQskkiktTOnvUaF
 um2QCU3AISgovQ7be70RHvyoru/tg0G+zVZ6zFelGu1wpNe0ktFkLaUXQRywjM+cSX1eGYBcw
 n/c4MykF1WjgrIKU8IQJyXXerwfsP5rjQC7HHCxmraMWcewc6RW3JXlumXVUbFtvwYUS2UDA8
 fv7yGdwmHC8zxBOrSBMs5DziowNpj0VFYrWoFo7iAE8p+7w1ivLh/ls/o15mcCSrztVQrVYkX
 KZFMfOE87XXWS+p72eC0iKonM8QvBFXMepcL1AGWIKOyOWgCLeNaVb60F4/EW2bsbxftEQkzj
 u9twVBfnkGKKsF20Ez2TIdlxg0RDqiTbTUhxk5SFohALD0h41IMM97Sfx7+YvOVB879mDHGGp
 7G8GObP7+jf54gacNmv4E7ZMZiWQ6OQ2xWO9z3nnkiMrY6+NgiBfPwQQiYPjXXZ5P6qXsKKy3
 vZ7J59TuZJQpdnFThXbS2yeK1h9sK+YBXhO63yPHBs5CtIkoyWepYQeScK194iizd+VyCg8w0
 mkt+xFUBocgJuJlnTwTyqIY58+FAinXolks5YkOz/9d0gP9qjLUht1Sh9rUSCL9tfKktdN19p
 QkeNAVOzZl7ygO4yOTR/T9PUNm20+JEpQy+oFQjR5EE5Ind9nLmeLfJYiu+y4Ki2yOm8E=

Am 27.11.26 um 12:02 schrieb Nick Dowsett via B4 Relay:

> From: Nick Dowsett <nick42d@gmail.com>
>
> - Implements the `wmi::Driver` trait.
> - Adds adapter implementing `driver::DriverLayout` and
>    `driver::RegistrationOps` - `wmi::Adapter<T: Driver>`.
> - Adds `wmi::Registration<T>` type alias for convenience.
>
> Signed-off-by: Nick Dowsett <nick42d@gmail.com>
> ---
>   rust/kernel/wmi.rs | 127 +++++++++++++++++++++++++++++++++++++++++++++=
+++++++-
>   1 file changed, 125 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/wmi.rs b/rust/kernel/wmi.rs
> index f7fbde29177b..235c4a2cef6a 100644
> --- a/rust/kernel/wmi.rs
> +++ b/rust/kernel/wmi.rs
> @@ -8,15 +8,138 @@
>       bindings,
>       device,
>       device_id::RawDeviceId,
> +    driver,
> +    error,
>       prelude::*,
>       sync::aref::AlwaysRefCounted,
> -    types::Opaque, //
> +    types::Opaque,
> +    ThisModule, //
>   };
>   use core::{
>       marker::PhantomData,
>       ptr::NonNull, //
>   };
>  =20
> +/// Type alias for [`driver::Registration<Adapter<T>>`], the registrati=
on of
> +/// a WMI driver wrapping a [`struct wmi_driver`].
> +///
> +/// When this struct is dropped the driver will be unregistered.
> +///
> +/// [`struct wmi_driver`]: srctree/include/linux/wmi.h
> +pub type Registration<T> =3D driver::Registration<Adapter<T>>;
> +
> +/// WMI driver trait.
> +///
> +/// Drivers must implement this trait in order to register a WMI driver=
.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// # use kernel::{device::Core, prelude::*, wmi};
> +/// struct MyDriver;
> +///
> +/// kernel::wmi_device_table!(
> +///     MY_DRIVER_WMI_TABLE,
> +///     [wmi::DeviceId::new(c"00000000-0000-0000-0000-000000000000")]
> +/// );
> +///
> +/// impl wmi::Driver for MyDriver {
> +///     type Data<'bound> =3D Self;
> +///     const ID_TABLE: wmi::IdTable =3D &MY_DRIVER_WMI_TABLE;
> +///
> +///     fn probe<'bound>(
> +///         _dev: &'bound wmi::Device<Core<'_>>,
> +///     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
> +///         Err(ENODEV)
> +///     }
> +/// }
> +/// ```
> +pub trait Driver {
> +    /// The type of the driver's bus device private data.
> +    type Data<'bound>: Send + 'bound;
> +    /// The table of WMI device IDs supported by the driver.
> +    const ID_TABLE: IdTable;
> +    /// The `probe` callback is called when the WMI driver is bound to =
a matching WMI device.
> +    /// Allocating driver-specific data structures and initializing int=
erfaces to other kernel
> +    /// subsystems should normally be done in this function.
> +    fn probe<'bound>(
> +        dev: &'bound Device<device::Core<'_>>,
> +    ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound;
> +}
> +
> +/// Adapter to allow [`Driver`] to be used with [`driver::Registration`=
].
> +pub struct Adapter<T: Driver>(T);
> +
> +// SAFETY:
> +// - `wmi_driver` is a C struct.
> +// - Since `T` is a driver, `T::Data` is by definition the type of its
> +//   device private data.
> +// - `wmi_driver` embeds a `device_driver` at offset `DEVICE_DRIVER_OFF=
SET`
> +//   as per `core::mem::offset_of!()`.
> +unsafe impl<T: Driver> driver::DriverLayout for Adapter<T> {
> +    type DriverType =3D bindings::wmi_driver;
> +    type DriverData<'bound> =3D T::Data<'bound>;
> +    const DEVICE_DRIVER_OFFSET: usize =3D core::mem::offset_of!(Self::D=
riverType, driver);
> +}
> +
> +// SAFETY: It's always valid to unregister a registered `wmi_driver`.
> +unsafe impl<T: Driver> driver::RegistrationOps for Adapter<T> {
> +    unsafe fn register(
> +        reg: &Opaque<Self::DriverType>,
> +        name: &'static CStr,
> +        module: &'static ThisModule,
> +    ) -> Result {
> +        // SAFETY:
> +        // - It's safe to set the fields of `wmi_driver` on initializat=
ion.
> +        // - All set fields meet the invariants of `wmi_driver`.
> +        unsafe {
> +            // SAFETY: `name` is valid for the static lifetime.
> +            (*reg.get()).driver.name =3D name.as_char_ptr();

Hi,

can drivers set driver.probe_type =3D PROBE_PREFER_ASYNCHRONOUS? If no the=
n please
set it here is possible.

Thanks,
Armin Wolf

> +            // SAFETY: This callback will only be called with a pointer=
 to a `wmi_device`
> +            // valid for the lifetime of the callback.
> +            (*reg.get()).probe =3D Some(Self::probe_callback);
> +            // SAFETY: `T::ID_TABLE` is valid for the static lifetime.
> +            (*reg.get()).id_table =3D T::ID_TABLE.as_ptr();
> +            // Per the documentation, new WMI drivers should be allowed=
 to be instantiated
> +            // multiple times (see `Documentation/wmi/driver-developmen=
t-guide.rst`).
> +            (*reg.get()).no_singleton =3D true;
> +        }
> +
> +        // SAFETY: `reg` is a valid `wmi_driver`.
> +        error::to_result(unsafe { bindings::__wmi_driver_register(reg.g=
et(), module.as_ptr()) })
> +    }
> +    unsafe fn unregister(wdrv: &Opaque<Self::DriverType>) {
> +        // SAFETY: `wdrv` is a valid `wmi_driver` previously registered=
 with `register()`.
> +        unsafe { bindings::wmi_driver_unregister(wdrv.get()) };
> +    }
> +}
> +
> +impl<T: Driver> Adapter<T> {
> +    /// C wrapper for [`Driver::probe`] function to use it as a C funct=
ion pointer.
> +    ///
> +    /// # Safety
> +    /// - The caller must ensure that `wdev` is a pointer to a `wmi_dev=
ice` valid for
> +    ///   the lifetime of the callback.
> +    unsafe extern "C" fn probe_callback(
> +        wdev: *mut bindings::wmi_device,
> +        _context: *const c_void,
> +    ) -> c_int {
> +        // SAFETY:
> +        // - As per the safety requirement for the function, `wdev` is =
a pointer to a
> +        //   `struct wmi_device` valid for the lifetime of the callback=
.
> +        //   This is the definition of the Core and CoreInternal marker=
 lifetime.
> +        // - `Device` is `#[repr(transparent)]` over `struct wmi_device=
`.
> +        let wdev =3D unsafe { &*wdev.cast::<Device<device::CoreInternal=
<'_>>>() };
> +        let data =3D T::probe(wdev);
> +        // As per the C driver subsystem documentation, the return type=
 of a driver
> +        // probe callback is 0 on success or a kernel error code on fai=
lure.
> +        error::from_result(|| {
> +            wdev.as_ref().set_drvdata(data)?;
> +            Ok(0)
> +        })
> +    }
> +}
> +
>   /// IdTable type for WMI drivers.
>   pub type IdTable =3D &'static dyn crate::device_id::IdTable<DeviceId, =
()>;
>  =20
> @@ -140,7 +263,7 @@ impl<Ctx: device::DeviceContext> AsRef<device::Devic=
e<Ctx>> for Device<Ctx> {
>       fn as_ref(&self) -> &device::Device<Ctx> {
>           // SAFETY:
>           // - By the type invariant on `Device<Ctx>`, `self.as_raw()` i=
s a valid pointer to
> -        //   a `wmi_device which embeds a `device`.
> +        //   a `wmi_device` which embeds a `device`.
>           // - If you have a reference to a `Device<Ctx>`, then the refe=
rence count must be
>           //   non-zero.
>           // - If you have a reference to a `Device<Ctx>`, it is either:
>
