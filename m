Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783331;
	b=ZngVfS8NWZvzuw5lksOOzXLN1k408iqrUnrOINPhevuAfJFTiR2408D85AtQtB62FZeq
	 G6zKWBiDFU1R5aO6XHeNTekVvX3KaJ5ESMc/GBPusqDFKfHOnTfvL/CpVeUkYOBoYb0Jg
	 pPpS4MFr2ugPlwTiNiw8Isb9k9XyE72U6bvD26GNo7zEOv56N0IX49ZxLYuhAyLN+7YLe
	 cxdBTiZSSsVFQ/bxF5zSwdM5bZ6llwUraOAqPObnemfvHBgWqMrJqez18pz/1IelMGBzt
	 XT2oNTQHJzIfSpR0Ys57yS0ul+lDp2nkkSTYWNaIbQtziLVd9oLUKSR5VyxV/I+0YLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783331;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VtKiZFj6Ka7y5JG1hKNNq0d21tsqo0FM1O+R6HYWx5Q=;
	b=Rhc2GzLDbt+1GWMVqNhG5e6ns8dVFxHKF0/H5TIrySzZ/5C8j9VQ7W3JqPK6b2P+NCBG
	 wZWmnSFvJeN2UDv9HE9l4/++XZS4M2QGnOx+k6DgjefsW/OXr5C2esQb5LArEA53bawNP
	 IJezjGnn74YchDDyKAwYe87UcLkhvytJWhdjcRsWSbQWpFMm5OJdySOqrG1ayMXXoe/96
	 tZUU7F974StReilYwr/LjppvJp8qlxfRdAMUmMiUQj7vAQ8SXA39Jr2YVcUg44bSgiHyX
	 XXSuuomsx5d5jna9VRZeVYMKwQdEhyvaJ4FnLb0RT6tlsfoUsIzRReGeZP84IsRVXSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Ucp/CYJo";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E4eROegs;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0763606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0763606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ucp/CYJo;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=E4eROegs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795783329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VtKiZFj6Ka7y5JG1hKNNq0d21tsqo0FM1O+R6HYWx5Q=;
	b=Ucp/CYJoG914xB7QGs+JeCmoNpHaTEEFVO/ApntzTbYgKQdFcmJi4k/dOikNajXgljyf7v
	buyeXeokZpKdFUtYUum3hKEmRcxWn3SMYg7l8uxkLQkWoMEhzzcrvjARH3ElleRtwB32nM
	5h9DH41MK1yCg+GoRMRalL7HMPu/5eM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-hVMp24LrOSia7ZWt517w_A-1; Fri, 27 Nov 2026 12:42:08 +0000
X-MC-Unique: hVMp24LrOSia7ZWt517w_A-1
X-Mimecast-MFC-AGG-ID: hVMp24LrOSia7ZWt517w_A_1795783327
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4bcda4c853aso1024070f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795783327; x=1796388127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtKiZFj6Ka7y5JG1hKNNq0d21tsqo0FM1O+R6HYWx5Q=;
        b=E4eROegs6ZGwoV+d1p1kY2CbCj6zVEsViXMdACLbAQ995JTeoSmloMb2t5nLznG+5k
         KARJFzv82PkZLVgn23CnRLly8B2qPu1qrDuMnmltfiEPOf6J+hj+EZSTdGEJWlqFEeIp
         jtk1VmRnohsFacKH4FFd6REh84kcnjBCTWLpBi2+0Hk/OyC78npJqZjzDeeIzyrk1PTM
         OJGkamaurryINYX2QI0w5tjorPj3dnPrzehzEt5wzcFphtiSFfzsp4YRknobprgcflw7
         Nz+XlULpzOGK0jOA/jNqJRMvjWIlnMa/UlY9kXGjX0OsEScEdQ9TnRqij9904vpD6E9H
         zlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783327; x=1796388127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtKiZFj6Ka7y5JG1hKNNq0d21tsqo0FM1O+R6HYWx5Q=;
        b=TyraprV3zhXPoy9AvPrDlOOG5oUgf4F7lhITlm/h8hPxR35B6jRBKIEg3FX6Lr9ucI
         ivGa0BgFUnzI5UrMPoUvBjIKVyPmpcVTenIJ+zjAmUNuQF5phyQBePNwoi8++7DptHcZ
         mQ6R77YiczHL3htqP3BNeEmmqAPrl2fppQBSSYdfkxpIP8UGSND5JKIyo8afQGOKfocL
         Mig0a2h/eNQWuMj5rAdZtSW1eW9LIdO1rGmmfTG8GPPCGPJK3L4SAuvVhmJaHjWMA1As
         58Xs5MC7PDfiy5SpPfgQIy6gCHtdt3qQnscHggoWB13mfz4Q2yLh+eYp3XfZ2lezNmaK
         HhkA==
X-Forwarded-Encrypted: i=1; AL+hErFMnFNe1S+vVlTt7R56yDIachvfo/9+GcgtzEJYm1X0Ux+4ljijCyRRDYB86AUnFGunPhZcqupUz21sgG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q9FnP0mwnXX3dV9H6QLYFOeoLSttItJF1HDIWBzpSomBuEFv8
	+d/rBmLXwGvUtQKM5hlm9LLQDVW8enNP9+GGUwWgkm5ojT5awFW4vszuX4bJVmlD6Ffb5q1WRrh
	Y5B1WWcSJZEuilNp3+zfhH2tI7NAssGg5LFBrQY+8ZLePG5CDxcouCz6D8lzJrTruVw==
X-Gm-Gg: AZFdTZegyCPvgIzR70Pa40VsBmthUck3hCzyktRZMQtU8+npc98a1KObpotymc1JBGu
	AttAVaORobMmzzFhQmnEa+hy1xcZiRE79lh4v+YuAZNvL6G1thuNn95fLnkzG9MHlpJTzNFLySl
	Rh3DJZeElH6IEpGo9hM3wy83Xul7bcp5DkGrmZQSks8umtWnSzLQYUVC7eNSJaNkusInPqlJUwy
	Wm/jC+aHjDnJXnZ0LrxvgkrhIofOlXUJXHG7ft9BJnP8n8EghX2YVofSBjqEgPEsVVZd6oUhtIv
	cT2Cl4fbxPqxZjHLjP3CffDhEXy8jXPM4Di39x/VLFoMYCpBvDB2I/j8sBFC5Vi70Kg/zqQduwG
	FRJPKETwnE5e7PDCOl5xpoNw7IZa8LnVmlt0bTWFMWrhFkaxGrkifUPQenLVw/ZVGgm6XrR0KtW
	n2pPIe8M3IyRP5vgG7Ee1G
X-Received: by 2002:a05:600c:4e02:b0:4bb:8636:dd7d with SMTP id 5b1f17b1804b1-4bb88817f77mr489726735e9.24.1795783326729;
        Fri, 27 Nov 2026 04:42:06 -0800 (PST)
X-Received: by 2002:a05:600c:4e02:b0:4bb:8636:dd7d with SMTP id 5b1f17b1804b1-4bb88817f77mr489726405e9.24.1795783326379;
        Fri, 27 Nov 2026 04:42:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8533579csm593732225e9.2.2026.11.27.04.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:42:06 -0800 (PST)
Message-ID: <4ccdd654-f8af-4e51-a8ac-ae7f68f0db07@redhat.com>
Date: Fri, 27 Nov 2026 13:42:04 +0100
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
Subject: Re: [PATCH 2/3] drm/panic: Apply the QR mask while drawing data
 modules
To: peder.bergan@gmail.com, Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261126-perf-drm-panic-qr-v1-0-51856937dc4d@gmail.com>
 <20261126-perf-drm-panic-qr-v1-2-51856937dc4d@gmail.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20261126-perf-drm-panic-qr-v1-2-51856937dc4d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 17:53, Peder Bergan via B4 Relay wrote:
> From: Peder Bergan <peder.bergan@gmail.com>
> 
> After placing data and remainder modules, apply_mask() scans the whole
> image to invert the unreserved modules covered by checkerboard mask 0.
> Data placement already visits every unreserved module once.
> 
> Apply mask 0 while drawing each data module and each zero-valued
> remainder module. This removes the separate image pass and its buffer
> read-modify-write operations. The format information still advertises
> mask 0.
> 
Thanks for your contribution.
This code is executed only once when a panic occurs, so optimizations 
are clearly not a priority.
But this series looks good, and keeps the code simple.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
> ---
>   drivers/gpu/drm/drm_panic_helper_qr.rs | 35 +++++++++++-----------------------
>   1 file changed, 11 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_helper_qr.rs b/drivers/gpu/drm/drm_panic_helper_qr.rs
> index c6ed395c05bd2..1d96ae855052a 100644
> --- a/drivers/gpu/drm/drm_panic_helper_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_helper_qr.rs
> @@ -691,12 +691,6 @@ fn set(&mut self, x: u8, y: u8) {
>           self.data[off] = v;
>       }
>   
> -    /// Invert a module color.
> -    fn xor(&mut self, x: u8, y: u8) {
> -        let off = y as usize * self.stride as usize + x as usize / 8;
> -        self.data[off] ^= 0x80 >> (x % 8);
> -    }
> -
>       /// Draw a light square at (x, y) top left corner.
>       fn draw_square(&mut self, x: u8, y: u8, size: u8) {
>           for k in 0..size {
> @@ -864,37 +858,31 @@ fn next_available(&self, x: u8, y: u8) -> (u8, u8) {
>           (x, y)
>       }
>   
> +    /// Draw an unreserved module with checkerboard mask 0.
> +    fn draw_data_module(&mut self, x: u8, y: u8, bit: bool) {
> +        let invert = (x ^ y) % 2 == 0;
> +        if !(bit ^ invert) {
> +            self.set(x, y);
> +        }
> +    }
> +
>       fn draw_data(&mut self, data: impl Iterator<Item = u8>) {
>           let (mut x, mut y) = (self.width - 1, self.width - 1);
>           for byte in data {
>               for s in 0..8 {
> -                if byte & (0x80 >> s) == 0 {
> -                    self.set(x, y);
> -                }
> +                self.draw_data_module(x, y, byte & (0x80 >> s) != 0);
>                   (x, y) = self.next_available(x, y);
>               }
>           }
> -        // Set the remaining modules (0, 3 or 7 depending on version).
> -        // because 0 correspond to a light module.
> +        // The remaining modules encode zero before masking.
>           while !self.is_last(x, y) {
>               if !self.is_reserved(x, y) {
> -                self.set(x, y);
> +                self.draw_data_module(x, y, false);
>               }
>               (x, y) = self.next(x, y);
>           }
>       }
>   
> -    /// Apply checkerboard mask to all non-reserved modules.
> -    fn apply_mask(&mut self) {
> -        for x in 0..self.width {
> -            for y in 0..self.width {
> -                if (x ^ y) % 2 == 0 && !self.is_reserved(x, y) {
> -                    self.xor(x, y);
> -                }
> -            }
> -        }
> -    }
> -
>       /// Draw the QR code with the provided data iterator.
>       fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>           // First clear the table, as it may have already some data.
> @@ -905,7 +893,6 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>           self.draw_version_info();
>           self.draw_data(data);
>           self.draw_maskinfo();
> -        self.apply_mask();
>       }
>   }
>   
> 

