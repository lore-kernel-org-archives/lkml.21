Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795131192;
	b=aWcG2TqmKE3V7/JAY4AiRZcW4ul8oa9+5ue9NLdWei/F8WTtTFKUIZ9iLiGCKxk6dIzO
	 vxm0dPs0qnqtvTiH6Jen6C1fGuIph0MD1vVirCW75n5Fon7FgLHeQ4R2xU0a1hSzSF4yU
	 WBUtilbJeHTVAkDfo0eNHnqs6o0kp4HwY7+XH+XUSF46K9dm7AxMIXMNBJEc8O4CCgoLz
	 DBDN/fPE/VwWC42vbII6PXHM5Ko+0/zgB21nm5VdbXf14DUOPGZUj5zlxtqbrEMEqzjej
	 5gnNHIffe82X5xW7wZf/+NzKRQqEjbIXFp5sVrVbV+E0I2nv8QYe2WWv8/Qth3L9ITg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=;
	b=KJWjbiSXMZRP6flhcRgGyVG3d2xNK4rMCzUzQady7Je6e+8MlF1AjdOcRCc/ztOdP9VE
	 qumG46xzJx23PcwAyM0+Jxsl8+yj6Px8F5ra77H1N45pd3C/LxVSIuldq/KgkNcHI27jc
	 gwaq9xuLRd1KT3FoOdYniCUw0ulzQKK3GJxi87t2Bfn+jMepB0k/9Uy/vC2h8cWjJFJ5y
	 sEC+TIrMO5BKIkdhzHvp5x8veWo++aArzQjOwaYCv4g4td5Dxe7bPP3EFGsElAZiC9CEy
	 7PoJZ/MBF0PTaSmL1a7t/oEm9L3EkwBo22fHytTWciZUAYfaH1AsAT5k3wHyGPw+PEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="c/VhU0Ed";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F67606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0F67606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c/VhU0Ed
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc53938a8fso270742137.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:33:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795131191; cv=none;
        d=google.com; s=arc-20260327;
        b=egejTKV3aXEc94yGBpfm8o86oPEdkYKepvurU0Xfi4mfKE+HLe2qjxMFCCEzph79lo
         PSjYw9OMwLxYXpDIOVz24TTsYa+K5gzOX1mU4KkHShl+j4+90P0j19bIXbmtShUGd0I9
         HRYIh3dZ5TZBjnAYAnukq0GIb/iaVOCixF0BkANLs6xYXrXKRJEKEQQHe8qee4C/7Ze8
         66fzwfx+wrEuxC+eSNeSTAOgF+N2xNgQnL5IxpGeZEJ/XPVQo1pVvEnY/FPBgb/jiiYy
         cnmHP5GIOuOXUXTsbd/8tE1iMHhby/aXS97EXBsMJRt5PJtovebPIXeeJjlRVtwA5RHN
         9C/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=;
        fh=fY0PGifEU7cU3IVGMevwzxpawMgSFzD4bRCUdWcIkms=;
        b=h+Tqx8mNIa9AkGspHPQQG4JR69Xvor1cgtBJssu/7NkmnCYHL70dq6EH9vJ3CEmfRX
         ryZfmJGwI7yvm3sbhDtf3PcIsbx0YsRBzgHT0qxNxEletzPs/b+F1ZM2bvZaJ35B8baD
         Vda4cCc7H49dxJTQYja8NXG5pP/QELnWLXNAQPPIcKT1giJdXyVZz5TsGt5EFIMDeLHS
         Dn9Z13blsWjxDeO/IK3yF07j9dXzCHMF+GajQQ/qqWqsC0UeFKrhG2lNSb9nDFjRUxZS
         IOZsY0v3A6S/6PET3qW1uYHLAUutipoFl8Mlq9eRKbVA8TrjCAmyD5fdk/CEjkCoUpbF
         IBaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795131191; x=1795735991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=;
        b=c/VhU0Edpz5YnJd+BLr+Bp3y//88SlotKoNmysrUmM+wgwOh34GnCLyUaug+TzKcyI
         qEZTIqNbbvGDMXibgzJOxOno1w9jI/2WSpF8vGqqEEQw1ll1qPEqoGQoGS3p1O384pBh
         HsVlfgX/0H/x9DHwCBZC1oPXIt7vcaZr4fFgfBMcWZhRAZvSvKFmN9CCb8r0Apqrp+Bz
         qlxLh4zCU/7lVxbKU6jyyw5hZQsRias0dfxk2YoJtb2wX2g0wP55AEeRbsTzRmd/bMWH
         REBZH+xLS1/ldFleeYjLTjB4SLsaoJ0WE6lvDtT2OVrdKOwLSUhfgtPoXzyvKUQ1kmfq
         VcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131191; x=1795735991;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=;
        b=NXaaJR2WrcXK95uvStrEcHy0JWIdkhAUH0Us27vpQxzmHPhdAxtTpNRqiTsEtF3qL7
         PSaNpcTbTsM1L+5Dgdqw13WhZPnR0OEJZokJIRp74+ndBzGd3rehUxb0pnik1bb0VlE5
         OBhRks9F44512hM9oCD5ebayF7CkmOGeFefr1pcMXmbpqLmKcWvy6SO9ZRnBHCGZNc+/
         KeN53i2/7TE2d14CtFpf6czytggt5yQocAW4DwKUprQJT40yEuwlzRVd/y63h3zYNWyi
         fH89SD/mX5XY4J61oZM9ueIfhAreV6e2UjOn7jqY0LaiPa3f/kfpXPsSMY67motssztG
         nHPQ==
X-Forwarded-Encrypted: i=1; AL+hErG10qdDm0bQb5GXMZ5F2vd8dud7pV9slonGpvGKEsiMF6YKtdWccpussvsFDwj2REgzV2G8TpeNujcMtxQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PTibX8j7C2JQYBwqhBpayM00OIR+Ggurk4Z6UYkvKXTOYStNo
	oCgJNwf4LLbiC4XBHcL+w/8V3XoVl3puuRkq55LbrS7u1vW61A9HlMLDKrfTbJDOmZkG02bMfP6
	7s7xPWPDuxIKWal3EUx2NzpJReJg1qcI=
X-Gm-Gg: AYBFou2zebRzxPlsSnYevu6gPiqXgDWdFTCdw43XVD2M3miEINwq3S9Uqu+w7dD8/wl
	szlXVVT2MZCX0xOz1T2Ct16QbMpRaj0w6dFyUwi5nEirmpDQK9HD384s0LXmfOiNvZs7udbFKxi
	+tgdEOvtbCwjH/tSBoQYIxJoec3wzC3CrhAmKN8jSNffUpKWL7qKtG3W1LWjf5t9flZxb0TD5rF
	GvISjyecKzpcWj+oDMvR77X2kGYfjIL2SaopDRLNjtoQ4I76xb1tX3OV5CTSCB1Z+LFepp7l4W+
	R21ObLViLLjZ7bBeyTDz/BfpOTrioGMkQ1b4B8LVEXHFtg82E2XPOmJ8mRrZN1R2HAohJOydyHi
	o45slfjiObt7H60cGdt3Jlc4aU+X/rkrUweMV1u48vDKhhbCXdVzH0TYzwbtB5pAdq1R//0rnbX
	zDKDgSHhrZw8WbHhwWv1gJ4LgyE3Ys8Ks/hVH20D6DL0UFvl/vIJ6zHD+ZqaHNW+sGL3CAq8tmE
	xjZ9HgqAzU4AGgXmwVt9DMbQTki5g==
X-Received: by 2002:a05:6102:162c:b0:7d2:b199:6710 with SMTP id
 ada2fe7eead31-7d7394619edmr563227137.15.1795131190654; Thu, 19 Nov 2026
 15:33:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <20261119144848.4ddd88cb@kernel.org>
In-Reply-To: <20261119144848.4ddd88cb@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 16:32:58 -0700
X-Gm-Features: Aa3M54pl4hlXRMcwBzZFHc9YCWzUYN6am3kufSQboJBVsJ7s6nPiZ-HbdhxnAag
Message-ID: <CADvTj4oJ6HDR2k6qVgefUX-h0TGh2n+AO5gx_dcJFzzWML+2UQ@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 3:48=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun, 15 Nov 2026 17:58:26 -0700 James Hilliard wrote:
> > stmmac_set_features() clears hw->rx_csum when RX checksum offload is
> > disabled, but sun8i_dwmac_rx_ipc_enable() unconditionally enables the
> > hardware checksum engine. The MAC therefore keeps dropping packets with
> > invalid IP or transport checksums before they reach the host, even afte=
r
> > ethtool reports RX checksumming as disabled.
>
> Rx checksumming only controls whether the _good_ packet indication /
> offload is communicated up the stack. The device should never drop
> packets due to a bad L4 checksum. Checksumming L4 is not much of a DoS
> vector. Oleksij was fixing this in other stmmac variants. I _think_ you
> should always clear this bit if it leads to packet drops.

The case I hit was `rx off`: on H616, ethtool reported RX checksumming
off, but the driver still set EMAC_RX_CTL0 bit 27. Clearing it let
packets with a bad UDP checksum reach the stack, where they failed
software validation. With `rx on`, the driver sets bit 27 both before
and after my patch, so the drops in that mode predate the patch.

H616 also has a separate control for forwarding error frames to DMA:
RX_ERR_FRM (EMAC_RX_CTL1 bit 3). With bit 27 set and normal filtering,
none of 100 packets with a bad UDP checksum reached an RX descriptor.
Setting RX_ERR_FRM let all 100 through to DMA in both the IPv4 and
IPv6 tests. The descriptors had the payload checksum error and error
summary bits set, but not the CRC error bit. The driver discarded
them on the error summary.

> (FCS is fine, bad FCS should only be passed up if RX_ALL is set,
> but sounds like your device has all checksums controlled by one bit?
> in which case we prefer to see all and let driver discard the bad FCS)

Ethernet FCS checking stays active on H616 with bit 27 clear. With
normal filtering, bad-FCS frames produced no RX descriptor in either
setting. With error forwarding enabled, all 100 bad-FCS frames had
RDES0_CRC_ERROR set in each setting, and the driver discarded them.

> If I completely misunderstand things we should at least get a respin
> to update the cover letter. The commit message talks about L4 offload,
> and rx_csum is L4 AFAIU but the bit is called CRC which deserves a
> mention somewhere IMVHO.

The H616 manual calls bit 27 CHECK_CRC and mentions the IPv4 header
checksum. What I should have made clearer is that the bit also affects
transport checksum checking, but clearing it doesn't disable Ethernet
FCS detection.

Would it make sense to address the `rx on` drops in a separate
follow-up along the lines of Oleksij's dwmac4 fix [0]? On sun8i that
would mean enabling error forwarding to DMA and passing packets whose
only error is an IP or transport checksum up as CHECKSUM_NONE, while
still discarding frames with a bad FCS or other fatal RX errors.

If we leave the checker enabled in both modes, `rx off` would only
control whether the driver reports a checksum as verified. In that
form the follow-up would replace the conditional bit-27 write rather
than depend on this patch.

[0] https://lore.kernel.org/r/20250818090217.2789521-4-o.rempel@pengutronix=
.de/

> --
> pw-bot: cr
