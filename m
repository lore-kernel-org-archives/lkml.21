Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483943;
	b=c+P8h21A9GQsniwMCWIq+1d1tsblkmuWGk1vwVjJhM+ahBgBcy88HBq+S0ASCgyXkjbb
	 BNJWGWlmIYz1CZhCSGg8K06Yh+oB2kmG1JuhPb93OgEIxztunvPhOuFPAugunrV3F3h0k
	 WqywgcJoG054kbCblKmFQBK3Fe4UQrUjd4qHoSLCm372aE8w+DhwvwE2mBpd5lTKgDL0T
	 SEsUKIGyeUQ7MSiCw2PRDecd0sjPhJT7fmlfG+HVG+RXnsFsG0z3EWt1ioBCPdoFn3Y9K
	 GZbSD957WiJQPNE3vsVmHvyvQ0IVLquBxE5AJKDIABblvLeIGx705agUArbkzZknHlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nAKiNemk2GJJwDYP8p1zRplDTIqlR1poJkDMNc9BGdA=;
	b=Aua8J4RlemiNhPp5B57PN38txLQo8nGKtKP1goYzb75vxS9LUh4/0IDdh2SV8qhqHcIf
	 gnU4uIyW8cgu99Ubi9xpxEThYR4QF7V2EAyhYNr+o18Stp9O3VZz4bdAqKRBVodWeVO5m
	 5ByY6miJ0QFIA6JlVCdYCKBIeYAzRHUq45PMatXFR47M64cMBvM66mdHgo1BmAHC5X+DM
	 8WZJ1y7WhDK3rddBGhg3vhttL4g2hUO5JjCVn+PRgyRNE/3F3Yg23xcPeqJgRXP7tW2zI
	 TDER9TKbVRo2tfzEgZIGl60DXrNJIg1KiYOWp/0COnbna5N3aI23msbc4Mfqod8kQ+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fgZSWi0C;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EBF606A334
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EBF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fgZSWi0C
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so5736363c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483942; x=1796088742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nAKiNemk2GJJwDYP8p1zRplDTIqlR1poJkDMNc9BGdA=;
        b=fgZSWi0CfA8PjW8babAeGvHSPwaWYbL89BEAHJy+ktqIoYDUEZME1smhCOfnnxW0+v
         AFjfxviZRLBb005A2J+N/u36TKD+8tMxY/1SOdJbY7xYvu/hKN6jekjXk0e1gaIPmd74
         QPSr+c9G1gHQukDwmEGlBUeunAbqz5t0Vbq4EqemoslU1kmBx3b8CA+HoBhDsv0ArvYq
         U+QjlfzW1u1efaiUDglKRnzWqaBCiPSsx7ev1Q6t8ZLwrCeywfWkt5bYPmdbipveu3Tw
         bK8aaKxc3z/js/1HAmRkiAQn8uwcnzE+jUkhP05Jyge0CHDjEMfxgwhiIi2bShYoInug
         rYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483942; x=1796088742;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAKiNemk2GJJwDYP8p1zRplDTIqlR1poJkDMNc9BGdA=;
        b=VhuffzkkdAYg8iHQYwPqa+CnTP8Ue9C7R3fqQ+NfIC/0MoSQC3+vCQd7jrU5huzlrw
         dK4WNxJ3VPYj2PbE/L7uRE/UVKgDJ4KSjKzd3ptRkz1bjSEjKRw/kySPaXKMm4umVTxp
         iWla3BKmpEcBrs+9sslEWdPzBNp11TBj7vgc1lUrXhQZEjX+xfIH8Bq1S5iSPKWcosKi
         Di9Cw/UevBPbQWa31Z1JKc417Cu9BVd0e+4Fj7iUtj1tMrD7HNJ1qNDRi8n8nkvfN0dn
         VqCMHU4YqW6uEhUZcXc+p+dHLhUDe35R5XU2Ctv763O5L2YuE1o1uL0EsuaUeCD2tJOZ
         0Opw==
X-Forwarded-Encrypted: i=1; AL+hErFc+X83TCN26ie7BVJRzH5jFzhm9sEyNEA/+zZNLQHb1+a+A/a/Z70M/7t9uBRG646MjDEf6Y/iyHqWiaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U0Ot3q+fuBt9fyWemHpfxATbcUNW9nDbvPMsBfljbCqQrUmWl
	BECGJgzPnQI5le1qVha9XRwGo21wEicpJ4JOoRmTHke1LyZq2YN+l63g
X-Gm-Gg: AZFdTZfllo7mE7rcM7PVhaWlz49TIIiJXdBKzEfA+1pc6v14m2JbWVJ+Bwsg1y2rmXR
	Jj9HXODBTnPpHcnrQDYZP6VXcY+4p392zAxnOLIMyXlCCR0icGS7R9xz0n/HDgcbmA9Ra5wM6rb
	hogA1BSSc9EwgFx6FnNty++zEUOqbDStqyZCCJ6VF2wEC29cfcUszYd7VyeF9EEcTpDdlJjdC8r
	GNzLYawhMIR8Nn+AZiXEKoR3Oj/XhE4Tgj/vq1B7mx2t2ZArEaZnKqKfXoegyQbMTOucbwma2Qz
	g7BJ7v9CDE7n3acioCUJaRGhH937ypJ2UpaAIUewe0hHMfOI69Twrlo/tGLw23b+DX0QrvkRqJb
	EOfnJQZ2AGkPHurA8RNxL12lOYKnaF9FTGF+7SUnIFWYn5Sg+bJ2/ZELFD3Vv7aCmwEgSNYRThC
	q5O2D1lyaeIk3lhi6fUAQnz8onx2nel53lTJL400lqZEiGPwZmdB85gy+gz4B1T6wAgshRAPu/l
	Y812BfWHEn3Pmsh+U564vg0D5mjSPCLfWrv8bu9q7RripRmArk0qgUp187awQHB8Zdw0ETA8526
	J0uIfgozXCUyE4rdWXluKZ7IZkGtDr/CFTBUTwF+H/oPj8fONBRHgeJvhvqv9RZT+mx93pg=
X-Received: by 2002:a05:7022:f90b:b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b5568ebfaamr12146790c88.30.1795483941534;
        Mon, 23 Nov 2026 17:32:21 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm34017451c88.6.2026.11.23.17.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:32:20 -0800 (PST)
Date: Mon, 23 Nov 2026 17:32:18 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guo Zihao <guozh23@xiaopeng.com>
Cc: Markus Armbruster <armbru@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2] Input: xen-kbdfront - bound the backend-supplied
 keycode
Message-ID: <awTpHuucnYYCHdx7@google.com>
References: <20261106014957.4130059-1-guozh23@xiaopeng.com>
 <20261106020217.48481-1-guozh23@xiaopeng.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106020217.48481-1-guozh23@xiaopeng.com>

On Fri, Nov 06, 2026 at 10:02:17AM +0800, Guo Zihao wrote:
> Keycodes arrive from the shared ring the backend writes:
> 
> 	if (test_bit(key->keycode, info->ptr->keybit)) {
> 		dev = info->ptr;
> 	} else if (test_bit(key->keycode, info->kbd->keybit)) {
> 		...
> 	} else {
> 		pr_warn("unhandled keycode 0x%x\n", key->keycode);
> 		return;
> 	}
> 
> The keycode is a plain u32 from the ring page, while the keybit
> bitmaps it is tested against are sized for the KEY_CNT keycode bits
> declared to the input core. A backend that sends a keycode at or
> above KEY_CNT makes test_bit() read past the bitmap to decide which
> device gets the event, and no keycode at or above KEY_MAX is a valid
> EV_KEY code in the first place.
> 
> Since the event sits in memory the backend keeps writing access to,
> the keycode must also be fetched exactly once: re-reading key->keycode
> after the bounds check would let a concurrent backend write feed an
> unchecked value to test_bit() and input_event(). Snapshot the keycode
> into a local variable with READ_ONCE() before validating it, and use
> the snapshot (as well as the already snapshotted pressed value)
> throughout.
> 
> Ignore keycodes the bitmaps cannot hold.
> 
> Fixes: 4ee36dc08e5c ("xen pvfb: Para-virtual framebuffer, keyboard and pointer driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>

Applied, thank you.

-- 
Dmitry
