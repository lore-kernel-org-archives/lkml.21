Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795222317;
	b=H3ANuSlz0pa15AxetnvqXsBPkTMrxze2bocc2wIKPA4W8kNKmBbNy8qdh+lfvwzDNEEO
	 71HfjFdN+Ut5q3wsz0pEHhAP+yYTjKzHv244BiLpS+72avtQQj7VsQrrEDImTi9gpzrql
	 9VgNuYjjnQ79K4d8JX0u7K4pPnZbW6/MvqXU6iKHDobyRAoRNYzBOb823v2LgCog7ej4S
	 53WHg7T1Upa20hs8usvt+b/PwE6ugOVM6jWeR2jTPenZBkzP47hmxJesr8dvpry4yftsc
	 T8XlhD2HmfYQAdVfV3nIo1T9VO2brlcBn2zrys1Ifc7TeP5+OchbP1ZKihOc+/nIthA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ig7WIxTxevZKkm/Ii0H9C7Xv6WzFctMV3ptvNpt2nDc=;
	b=rnuREKGl5OtaVfBoazDZ3dcSEVBGwsKPIrcULQVGtaHLDVPRFowU+ZOEGkd2NU6a3go/
	 42NYhZtefkZIIdJZ0BY/vzZw52FqlcbMo+NhltZrnrpu/UcmiYyCvFQI85yTITeeYvsC4
	 pyIa4fRkvurRlZGTXkWm7j6WMm6XokAlH9YIGUyruNRq0pTjP7k40/NhhjuDNz7yOOu3b
	 79cFD4/2kmGFrWi0z6z2QLb1M62RcFx3pYyWkB5s4+xwBweVtl3BMziUH8Fg5rOpm6Lt4
	 aK7umaQAI9u06CezJSytTnwJWomiWfRXoH5G1F6A9n/IZWNFehM7XyVH/G0XxZyYGGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZFmJXoz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4567606A6B4
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4567606A6B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZFmJXoz
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b878560a08so1507589a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:51:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795222314; cv=none;
        d=google.com; s=arc-20260327;
        b=ordwDnVlCEkJZ6JjL0nYi9DxflqcKUuc/Pn8abrTvKhEcbQeVl3ja+FM/UOorc3wv9
         nC46yf1cB1SqcEudvdZUcb9nDK4npq9/KnS3mDbuQ/41FhMljTXWstqcczBj3L0UwU7U
         ToGez6WiDjrnjeX2cBUubkfQ2YFGuu2g1cIDQugl01fKCYzNhwbmNlzYbGv+KSbfTdyO
         3aZO3UtRH3lwMdas88rEnXsuPvXck/OfPqZxhjn9lopOh7sfIXiDpRAj6p7jHwpEg/m9
         +N8LUSa8RYank3v2e1wzFSQstA5z2T6ZDOmt3kPOTe4xcl0AMCsE/Z3fGXZS46B4iOID
         mEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ig7WIxTxevZKkm/Ii0H9C7Xv6WzFctMV3ptvNpt2nDc=;
        fh=6MRUAV++/Mu+n9zyoaPgFKtZc2DTPZ3NxMUFnXWwqSk=;
        b=XsCkMkYxtfeeVq2W1xsxcP40GV7io+uCXUQ/ZjDLdi+qCGkZTs5BK7q8fpPXJ5ZbcK
         awV2etPMt1zYr2AMq4LvuwhTcGnDCELGuX0uoOopkRGgjd33z+QND6784N5cxh6O+skb
         KVJFnCgOWw3ayEDfDNq4zUSR59jBGfhx4RJEkRiD4wpk7RpS5fxufxyb1SnWvaJqjH22
         1nQ0MvFP+FWgBuNXdacWGHsHEQG81St6M4wHI8YJQbzxJk2gixAeaLTH7+t7bo4rC/ep
         MbtbVHma+qoK2YPcb4GVGNkPFbc0gA3FjYrNj9B3305FSV35R8KAYP7UnL6fUQuo0jwl
         y8TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222314; x=1795827114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ig7WIxTxevZKkm/Ii0H9C7Xv6WzFctMV3ptvNpt2nDc=;
        b=eZFmJXoz3LQnfFYSxkf2h29rOg7hsPqKgF1stZF2eSK2R/vJwyp5HIxIYaJAgtXgbu
         QfZiWt4WSJJ3N7wrVKMvYCRI1O9dUkH5IT8FsOASzVefBj8kuus6G5quEFF23q54UJ7C
         rzkcGWSsKydADG9MDyCCRHbo4VtFp+R9jybs0rUQhEFGW7jT8pqG9Mtr0Ovt+FHBbtDl
         mfX+VlZ2Y+BFI1eKAfZd8n8EdFQDKvCz1s8w+LvAnLlFA1j+vddJYg2LUOCOmvtQvRae
         DkQ0J+Jm9pDsMbvytuvFjfeHNf5GqPjBs9z/PPS6X+K03qCaB0ncgc7hCMjmRYXvDWH+
         AJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222314; x=1795827114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ig7WIxTxevZKkm/Ii0H9C7Xv6WzFctMV3ptvNpt2nDc=;
        b=SCurUimU3G/CpDRuYe6OfN8giIb1CejZ/Ing6zeRM3qqaFzOlXRkDaw16Wmtm+gV41
         hHuwfVcIM1IUDlGkPb9WxjAX0jcKj6hboP36WWlVn/6Tx1KGc4Ah+h3unA9utACJ0kmu
         g3UQSxKtwEiKOjRlNW/Y5TMja+jGWbwPvA7U9OKqoEKzlL6Ky5+7wNTl16Lx4fUKqdAT
         tIZHtU2NpwBPMU1OuYKjE7SaDX61IokO6zqtBYKGWlOdZXgubfkgzq8LuiP/Oa9kvRj4
         bBghofRCiDDhUTRccStV1JOdV+ZAP0cJGtP54J3mFn6CGqafFVwddZryxG/TD5+JS0IX
         hfXw==
X-Forwarded-Encrypted: i=1; AL+hErGfthVqw9FwMLzpoUPZhOb0Iaw8VypsLX2X7F4OJRaD7NYLmHzc7ReybZ47XA8reg/v0CnyzhvA2SvaVpo=@vger.kernel.org
X-Gm-Message-State: APuU4Z//Gp0VkAgXTjbUvkh5xZs9TXJqSeNdZd4dtSEa/K3NVGKAeIn1
	pFJjk/UBoGbc9g8VqPm6MaYMmhCO9jHJSk5FqQGSKZZWuWMQayWmAQlNf7SWY1L3mtRBLjT/ES8
	silpAcPyCLWN5hTiTOjP4s3t7z8fj42A=
X-Gm-Gg: AZFdTZdzSW5ObQ+T4qwY6w15FIgPNOa9B3WW9zRfgvBwD1pX1rg0s50WkIqBaw0Gq2e
	XwIEBHOn47F4lOlZoeZ4k/NWwjEncTOHSptOOobl/UG77rBkSKxhJUT7wZBawFISsUE3s2yVvM0
	xZR2pDr6LQbVrVWekcZ+hhjOrnEcEIMX8IXUJFDFgD1Yohc7S/wVTcQxOLrbCLIg9cMvQUS+tNg
	hgG5pJYH8OEex4TrWLa21i7EZKWjA3Yl9WiPpnLVs2l+Ugv5iiQ9Y96WD/9A8Aw3IcrK2+KVGr6
	cPU6jDEunkcfYXNUu0UfXoSPzQji0gaEJlvFjebi4VxbWVXkdpyJwyKFgc8RO/LOAGj81qX5iLh
	eM2W/s4EP0+4+Ili1k30nJuAChE/nJ7AJIGKVFfCKthVFjZ05Ammgqg/7xzohfNImz73d3Px71J
	m1OC3PNBfEpFQmnQaVXzG3vdVTLH3Y0f1xh4SJ2Sxc964fgu8voeABZ8gRR4wcvHy8sdW6kAE0L
	K+uWnRepQdrGj2cZ1WjLWeBnIHkWcUPAEv0Vluo11Uj+WxNGQ==
X-Received: by 2002:a05:6402:14d3:b0:6b3:e4e8:74ba with SMTP id
 4fb4d7f45d1cf-6ba1fb13893mr4063547a12.13.1795222314231; Fri, 20 Nov 2026
 16:51:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029173122.29636-1-rosenp@gmail.com> <0139ac37-fbe7-49fc-ba25-7b32df081920@broadcom.com>
In-Reply-To: <0139ac37-fbe7-49fc-ba25-7b32df081920@broadcom.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Nov 2026 16:51:43 -0800
X-Gm-Features: Aa3M54rLr4BLz88l0soc-v3JNg9m31Z8tj3Z9rFtN_CjE4dqfPJMuOMbo9FLveA
Message-ID: <CAKxU2N_jEhHSgtgoM6KP7WeDCP2tXq_krRKN=0tQfvY8DcrQvA@mail.gmail.com>
Subject: Re: [PATCH net v3] net: bgmac: fix RX frame length check
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@openwrt.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 10:18=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 10/29/26 10:31, Rosen Penev wrote:
> > While reviewing commit 77dac783f113
> > ("net: bgmac: rate limit RX error messages"), Florian spotted that the =
RX
> > length sanity check compares the length reported in the RX header again=
st
> > BGMAC_RX_ALLOC_SIZE. That is the size of the whole fragment, including =
the
> > space reserved for struct skb_shared_info. The data area handed to the
> > hardware is only BGMAC_RX_BUF_SIZE bytes, and the frame starts
> > BGMAC_RX_FRAME_OFFSET bytes into it, so at most BGMAC_RX_MAX_FRAME_SIZE
> > bytes of a frame fit in one RX buffer.
> >
> > A corrupted length between those two limits passes the check, and the
> > following skb_put() runs past the skb tailroom and calls
> > skb_over_panic() instead of dropping the frame.
> >
> > The check has no lower bound either. A length below ETH_FCS_LEN wraps
> > when the FCS is subtracted, so skb_put() asks for almost 64 KiB and hit=
s
> > the same skb_over_panic(). A length that leaves less than an Ethernet
> > header makes eth_type_trans() parse bytes the hardware never wrote.
> >
> > Reject lengths below ETH_HLEN + ETH_FCS_LEN or above
> > BGMAC_RX_MAX_FRAME_SIZE, and print the bad length.
> >
> > Only compile tested. Not tested on hardware.
> >
> > Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
>
> Rosen, can you address Sashiko's feedback and resubmit? This patch
> conflicts with one I have in my tree to support flow accelerator and I
> would prefer to get yours in because it's a tad more complete than mine,
> and yours has precedence.
Sent. I wanted to send these separately, but the bot complains no
matter what. If it still complains (most likey), feel free to send
your work.
>
> Thanks!

> --
> Florian
