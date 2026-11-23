Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463766;
	b=ct1n95AXxu3h2KFQo3fPbd4gH7Sdu1gMLuA0lq6dJOYQKnNUMpwRRNXlv4YhOZmlw/7g
	 5Mo5eooWtI5zbAWGJi8hqkqkVbYhZq+eBgVtD4Mfyt2qyFO0OzQIn7AICEk28OWTJBlpR
	 ZKq5ns+DmbjhXP+eq173cYOOvjrJijZAbxBIOw/GZhtj/Mzd/R/S6OwHGWA1PJ/zFVcer
	 EEqJCE5c3EgdcWB9heCqnNAk4eLV2P8gP0JtmySKFEQo9yI8UyTK4ppYXFhYeWiTozbU2
	 CJNUouEiirQ01zPWwIVCBIDqghB/aBDEB0nG425omwtN3tk3vPaf9G/QlPQ9o/m9NMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1MbpLLQj1VpGSo6dlmyla02LckOZ3odw3KGGh5M7V2Y=;
	b=eYCwNe/aCqhaoI8pk7BJ9sqhSTbRViG5TgPPh/1fjQHQhy2dbERfhzFQA+uCCQzPgP59
	 gxGtlQPMM68yVfxF+VGbtPjcKpxhaBEFWE+sbDjluP+fF6ZdyMVMOQwXmbQ1jGseCe3bo
	 tIlqXn/sD3ZJ70zl1EdLAE3eOYclxiq6RGxvqvcG00B425Pip1mdISyK/uyxlA+wWZ6/6
	 eUpyD1NOpyxWb38BOqyqgSv/NetCqGAMzY2xscj8UrQNGPhzR20FMsB73oqyylKJLqW+e
	 C7/VOxPApnWMBtTlrxKChzGf5/ROLVgiw96hylCKMsX/FGY0PVNZo3tkUSoTrDGc/ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILRa8rMf;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7546A606A33C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7546A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILRa8rMf
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso35901325e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795463761; x=1796068561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1MbpLLQj1VpGSo6dlmyla02LckOZ3odw3KGGh5M7V2Y=;
        b=ILRa8rMfEQRXX8PcvtS2W7TKDKsM/DcDJL5LU18Pte2U3PaLYKSECik2nz2JiQebGB
         h8U3yV6/FiIFQ2ZDOyRMyEX+8hp3azU5Girn+v8Y2xGN9J2Z2eVmV3Tq/PwodzA+8cfD
         w8ReIPvGA0X+f6F0X2YkV7fIkV3M7BgT+20Nw8w/o2zGFYbHApXNxHMEf+s3Ry9Ptf01
         u3ctDnm6bVmTmpv/ngofyCrsB2nhuyJfhkUoT2h1TGQblcjuPDkKDkopCxBxnpZYDdn7
         XI0GrpacwDINdZe30tCByNNsUhEC5sXD8qUQ5v+TUmA7KhsksF5KZR9hdFHNtPGKhK90
         hUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463761; x=1796068561;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MbpLLQj1VpGSo6dlmyla02LckOZ3odw3KGGh5M7V2Y=;
        b=yE8uaGJvRyK0v/B8lj8aAQmkpx65OoymSgVEYJ1FtLpm1mzll77xXbXuOn3KF6VfZy
         TxqSnyF2/znKi3nn0BjrJIsKjnhO7i1dlx6HA9oJDtVtajLMuEuzDDSPTXcUH4TFgudK
         fa1TQT2RozbTc6pjSMZQCjyaTPIv+uixgDQpaslEDu7LgeJOlHd4ZXsJJZGsG30H3oJF
         Uezv5IUJh6th2mCuHwiVT77rSP9KTCRz9N0VQPW+HVN6LelCbhupKVdjD+/0KXYoZInA
         A0qB+P4UxKLZ9+0hJExxhBaKdwtYmudol6s56GC9PeCdxkj+CfHyhl8MLHfc6YHrSnIQ
         sQMQ==
X-Forwarded-Encrypted: i=1; AL+hErE5yKoRkKnxHzhbUMb/mV4RkUWF2a4CMg3In9eVtUGyG9+tGjDGpJZLoX/e/ilbmAIzjc1ksCG41nMKoII=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HYgaJkvLMl6RxKVITzjNwxYcOxG7ev8IT4l7SplRuqvvU37Vb
	l/zmvIyNogO0CTTMr1CrVfsKJzBBfzAmrSHe2LDO5MJV3XBHLnfBItND7Wv0Bg==
X-Gm-Gg: AZFdTZfVgxauFZXAmfhVE95arhW9lroMkClFsonAZ1ZcWDlyGrzp+MUqXvwtKtNOiiU
	+eYhvEJscF2zJHIPqzfci0fyy6zj6hNGezk/pokc4Y+dW+i66TRyVm14IeaVHEpEkiRCmohAuW+
	V/VPPjQc8dFPmtRxiS7IBT9bacGlufCciZisO/lq9oxYA836HZBZfUNy5lD84kC6IV9qch/lWPv
	nd08AmE+XFb5S99tkDCA0e5wsIhjs+r53lr32KChdpGjKLBiOQoZF4j7mJiYWdfJDy+ZQIYfwyN
	4LlqAdyBzVh1NWaBKHVdS8gvmhw+QHSKjsZ3ofX3ywtOiZ8m1orh/cz1a+K3homg6KcOfMIDkw/
	ZpMKZUFgDF183IEUduJCn3iaMUDEmerJdjpXQ3wTXRMi5LqxqHphpZO7+6ls1J2vPW7k6RvugAZ
	wItCC7Q6KbRgU1i9UkE36jcYby36aX2RaPeXX6h+EMz9wtjRHlf/mIeVU5J/GER8dlOamIKkOdX
	pJ3cDabdK3qh3K1KfQ09sOxyOf0bCh8dzN3qADWuxPGTY1PX5kvSN+yRpd0w+E4IBSI8mmBVPyZ
	KnPbkK63e0a3Ru5fdXH/0JOh+FZZUYkXCZE0Yu/O
X-Received: by 2002:a05:600c:828e:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb88785a99mr241947155e9.0.1795463761275;
        Mon, 23 Nov 2026 11:56:01 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm445229305e9.6.2026.11.23.11.56.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 23 Nov 2026 11:56:01 -0800 (PST)
Date: Mon, 23 Nov 2026 20:56:04 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alex Kononov via B4 Relay <devnull+alex.albefly.com@kernel.org>
Cc: alex@albefly.com, Mathias Nyman <mathias.nyman@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Demote isoch buffer overrun message to debug
 level
Message-ID: <20261123205604.5bf490f0.michal.pecio@gmail.com>
In-Reply-To: <20261123-xhci-overrun-dbg-v1-1-4e5a2f11740d@albefly.com>
References: <20261123-xhci-overrun-dbg-v1-1-4e5a2f11740d@albefly.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Nov 2026 13:26:32 -0500, Alex Kononov via B4 Relay wrote:
> From: Alex Kononov <alex@albefly.com>
> 
> An isochronous Buffer Overrun event means the device sent more
> data than the TD could hold.
> This is triggered by the device, not by a driver bug, and the
> error is already reported to the class driver as
> -EOVERFLOW in iso_frame_desc[].status.
> 
> Logging it with xhci_warn() can flood the kernel log.
> A USB S/PDIF adapter (262a:9123) whose S/PDIF input loses its
> signal produces this event on nearly every microframe,
> about 7,200 messages per second, keeping systemd-journald
> busy at 100% of a CPU.
> 
> Use xhci_dbg() like the other device-triggerable completion codes.
> 
> Suggested-by: Michal Pecio <michal.pecio@gmail.com>
> Signed-off-by: Alex Kononov <alex@albefly.com>
> ---
> As suggested by Michal and agreed by Mathias in the discussion:
> https://lore.kernel.org/linux-usb/2ffafaa3-bdea-4d67-b224-2f18d76134be@linux.intel.com/T/
> 
> COMP_BANDWIDTH_OVERRUN_ERROR is arguably device-triggerable as well and
> has been reported to flood logs (https://bugs.debian.org/1035939);
> I left it alone here. Happy to send a separate patch if you think
> it should get the same treatment.

That's not device triggerable, it means URB size exceeded bandwidth
allocation. Such URBs shouldn't pass validation by usb_submit_urb().
Only a buggy host controller can produce this warning without any
fault of the kernel.

My Etron does, when multi-TRB isochronous TDs are used. Apparently
it doesn't support those, maybe it needs some ludicrous out-of-spec
workaround. Sadly, patching qemu-xhci to pretend being Etron makes
Windows bluescreen at boot, so IDK how / if Windows deals with the
numerous bugs in those chips.

If somebody sees this warning on current kernel releases with spec-
compliant xHCI controllers, we would be curious to hear about it.

Regards,
Michal
