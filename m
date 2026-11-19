Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122804;
	b=LB9A3GHaxdtslP9Qika8Crpuays+2Lgu8QI6xzze8c2xxFgO3oab8g1piys1Zsa+y/ue
	 2p1rTIgTqGnvkRRnNVNxPW8LTzgKUYwBZT3Emdg0WZTyrwX19kEnnaVD0/4UtYesJATwd
	 Mcr+DeWyIrKhVW4B2chDHu/mulrpxON3dgrIFVL6RcE5s3R0b5BfyVaYqHHeLrmwITYCw
	 xgXncS3fM2jXcsptO7BrtctQBnUk9Kbt/AsOC0Z+te61mTlIw1z7CRf0QrqZN1+y/NTrO
	 EhrBBDmjpx2+bYL1WBa96y4DRy1t8BLZTCdN9zDXugOUL0ZDOwqw4CemU49PXXYI1FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7uQtFNOdQLFaDhr2O+xKsh0q3GABDuv111m5QXQWzZQ=;
	b=DGamgELwb4kI2x0NjS7OiIFuxDJLxxLgxaVuX2AeVWvHqip9WJ883WC+LmloD1+b1Umx
	 6YBZKtx53Acw4h5AJqUoH2GHq/zRaEI44fcrBwtdalIkOZddsQePHSPQKR+Z7mIb8WtbY
	 uDF+Fc1w46U2JoOQpCmbTrZbLSnnfXvb415X8yod3qSTmTULCq3D3uPJCncEAH9V8Ka6h
	 hYozJo6yVBI2XeNMkE4wsQxxF9FX5kSwDKIWbyQJZ4/MGEKK0um1nNHldeOMXYzVqAOtQ
	 pg9E8KBwmLeFKugB3LI98Vs26Aie/ZHwHmGgSfb6Rp8MuorNfFizgf3CpvJZTXFmCUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWExxlHe;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E804E606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E804E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWExxlHe
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9496317b730so29680685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795122803; x=1795727603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7uQtFNOdQLFaDhr2O+xKsh0q3GABDuv111m5QXQWzZQ=;
        b=uWExxlHej4/g5IMBDYKhLOiKScIXVgK7/fzcH6uPm4B7PWN6GBFYe8hLUAyEn/NR/D
         yWcZtnkEjJ0B8q4SuHNDLDzaH58ZES6SCWCQz3EtIbIU57241Vop9zAETRC7e6LQ3ZuV
         GF+4KVNXMFPHAXcHx0kX8ysOznPl1EvWT9/s9gNB5ipWmFBgsNkdKIZnUP851RUyZCW4
         kIPK6Lzz1uETDrMf5HGJ3fBJpQ3RjWFS+k4qDmvFEItO41oRuGxzP8ToDnNKyGeaGyRL
         4HSoVGTPB0wHZ6o1DvkxzqkBZmEmmbYNTXgolxI6URnoVyGnEoZNDh+N9ssbSozCj5dm
         19Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122803; x=1795727603;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7uQtFNOdQLFaDhr2O+xKsh0q3GABDuv111m5QXQWzZQ=;
        b=I8GdZ7Uet20s1oROV0Hs0qBkEeZiN40IwbneAUhoI+sKqoGUG2//qQnr3UouKYSR7B
         T984OUaZerNNCalW7PSRKx9zeFUPFYk9GDB5Z5AfvvmGd6FxtNpHlgWgVxaro4IQvd9z
         ga7hHg6sv3ybqO/G3rDjb3Xq4tqKNftjFV500NNKL6zlPZ8EECYZP4Dt0uIMwIeek3yq
         acvT/gAzjFsQDf8rXatIIXwPAzE08kd5bLbaDObuHuc9S4pxyoyUQDTaKXORbrz0dVqQ
         emwe9JNL+cg5DZTHbtHkfEb1L8UEBt7Sjs++bBcTbdVJ3gnMi2Y5TY0pZeaFoOQXRsra
         O6EQ==
X-Forwarded-Encrypted: i=1; AL+hErHJS5lEFj+ml2JCDP1cvfeBAN1QCt72Tlg1+lWvLTx+n0eKz2noVMmEr0Nws+3Dj1H5MEvhEFMOAEukq8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ShpDdjybwyXjh4mSRqLhGmB7MJ9FdzVKl35pW79AcQQoJ9tYx
	kjUcRQUfh1PzswxA03iI+ljpgpZSKj+AVGwMZyiBWfO6c622QDms7o4c
X-Gm-Gg: AYBFou10pk8b3J/8+sHJrC1MI1yg6jmWgl80MnU7IOfnJSykVUWXqSH516rCQi+owoV
	hmR7gb856YQKt07YuzSLJBrojKTrBU2P6jmGUmEyQVdpB2JjzHwByQFle9Q/nplzq3d08efxV1w
	odQPDdRpW6ao0fYUC2SfsNNJcEDQFZI1YzyiqtESwq0Ba2tQVgasnsp07Al55T8bmnbp09vc0i6
	6pGBeOtqQzEAWVLVISZEDViXjLsUsLGtRTL3GFx3xgRDvINBr2aChw2iLz5TCLD9tV5xPdwf5lo
	aEfQSOMt4GKjr5u1zJYDpEVY6qi0Jv6/GwEyrpa/6pjwGpFBqHKoLKCfws4MxupKf0l970MgJb8
	sTQtOj8ToKna7re+zcIjLSeV8ytznTToJX+FK9vxIx4qIUzGn5GC9Gkep9uP0+kK/aHL6UqSBJP
	UV52+qArc5CZ44rNMiK2bJAiT84bshnJ2BNXkg+GsSHQS+vhCm1w/bHUaZPckfXTa3KO8pTCerU
	KCQNdMwui8rqiPbQOkyBcvPUn65xSnWXlKIpvjzabbOw9IBF5BoQi6WybNudhkodKNyviugtekz
	N6vhc1RskJyoRlKbQjh6t5aalq8vtMC8qzSDBjFYznnQ/vstuuWo+h9PArRksdL1SjRZ3DxI18T
	6FTyvdvljmAS8yXSXG3tsW9LJracZv97hYb8uSOjfdD41USLG1SreXiCcTqOCiRg=
X-Received: by 2002:a05:620a:460b:b0:93e:fa30:f1da with SMTP id af79cd13be357-949ba9e95f8mr157198485a.45.1795122802898;
        Thu, 19 Nov 2026 13:13:22 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34a38bsm47654385a.13.2026.11.19.13.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:13:22 -0800 (PST)
Date: Thu, 19 Nov 2026 16:13:22 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Gwanhyun Lee <gwanhyunlee@gmail.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.10e4a96974af5@gmail.com>
In-Reply-To: <20261119144241.360238-4-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
 <20261119144241.360238-4-graypanda.inzag@gmail.com>
Subject: Re: [PATCH net v3 3/4] tun: clamp zero-copy copylen to remaining
 payload length
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Junyoung Jang wrote:
> tun_get_user() also derives copylen from hdr_len or GOODCOPY_LEN
> without bounding it to len after removing the virtio header. A
> padded header can make a short frame cross vhost-net's zero-copy
> threshold. tun_alloc_skb() then reserves more linear packet data than
> zerocopy_sg_from_iter() copies, and the uncopied tail can be delivered
> to the network stack.
> 
> Limit copylen to len before the NAPI fragments and skb allocation
> branches. The requested copy length then cannot exceed the supplied
> payload. The normal skb-building path is unchanged.
> 
> This matching tun issue was noted during review of the tap zero-copy
> fix. An AI coding assistant helped prepare the /dev/net/tun
> reproducer. In x86-64 QEMU/vhost-net, a 14-byte input produced a
> 128-byte frame with a nonzero uncopied tail. The patched kernel
> delivered 14 bytes, completed 300 repeated short sends, and still
> selected zero-copy for a later 400-byte frame.
> 
> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> Fixes: 0690899b4d45 ("tun: experimental zero copy tx support")
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

Thanks for converting the original patch into this more complete
series.
