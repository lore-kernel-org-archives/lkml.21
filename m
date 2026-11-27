Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783286;
	b=VoyxX7hJW4NCQLALMsD4aNfg8XrOqcmEBMgeyUfDlrO1xhs6+vSNbMNWmxr2QATBVvGi
	 CZoQ2CkDCN0EoWdu0a8T1sT/OA5ekhHv3un9OZNAuWro+fNt8X8lhMPkpZqgDhzT6Nac2
	 yzUjykCoSZYD0579DQUTWwSSRlhRwsq6GTO49Al+1NYrGUjwuMdmY6oK0QYJGt36QMFCB
	 yeh2DTuOl27zokqpwhSInuG66mEGrXpewzjleVlIkYVt5S7KVgoDUIa5LbiJ4PS+XRsot
	 qN5lOCZRmccjxs2Lry1mP0VZzTVhN/jxaDwWLXQnEn1mhJ0diydCiuKBpG9m4l6+wFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783286;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=n6sjtzia/9qVvozEkPywWapR6k1Ealc6KRJ9DwbhjUM=;
	b=NpQlCT7ofB0mEkKjPse4HEUXlsi0el7io4cK3WYfnwKHvj7G1Y263YcRdbbctnbu4Gqu
	 emFiMUESVfJZxxAPbiXp+poahnzRfHz+5LbnqbiqrCahvaw22hukN0/sccDzeGQFHJ329
	 DxsLQmwXRkYVW0ZMQyUsNcfkFTdyagXzyMklmTw5anc39bFigUBNXWr5peXMzkR5QQqp0
	 Yx8eXPg0CniK6iuQtBoG+PMQhob6Hsv+YxKtbhM3q80V5olPsj2nNDALZ8EOK712jVZU6
	 OnUGrLIQLermUfhGiWsywk3eiWiJ2IRbdJNG58xw3/w6PYdJ7MF6j9YQhHCIWY1MnVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="e6BVF/6F";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=R07qCcvU;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDD2606A6A5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CDD2606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e6BVF/6F;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=R07qCcvU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795783284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n6sjtzia/9qVvozEkPywWapR6k1Ealc6KRJ9DwbhjUM=;
	b=e6BVF/6FRS7cwwGoEgOSJmveFKtArBFTPa8gU2ARGvFsZTzlQYcYr2zQnpksJ87VhvTv24
	bGdGxQt8Ga17ycO3HtiOqhdmx8TCx0vy+C+fiBjIg8a/VMS5Q9/sb7VR+9PyLjc32zAbqL
	1ze+kzN5HCg/MPnv0Y3xqs9FsZd4A34=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-qjFgXyLVNzaqIBY3d15HjQ-1; Fri, 27 Nov 2026 12:41:22 +0000
X-MC-Unique: qjFgXyLVNzaqIBY3d15HjQ-1
X-Mimecast-MFC-AGG-ID: qjFgXyLVNzaqIBY3d15HjQ_1795783281
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a370217dcfso7205776f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795783281; x=1796388081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6sjtzia/9qVvozEkPywWapR6k1Ealc6KRJ9DwbhjUM=;
        b=R07qCcvUenNX7zvCSi/Q0TladiqlRRNYIf7kCmAOCxIlIm3OXCj5bZ46ofsTFE7Jip
         JZvesH+HteLZ0ILP23cFGX5GvkdO7ILRUn0RcVF6rXT5lN0uGw+TihX4Y02EEYjhyXEW
         Su3Bl31xT4PkJTx9wHkKOml8ifrTbMRjBKjBSJbBNUQxPeODHqYMtJID1Wg7yntqrWAZ
         KqnrRle7Xwxqzgu2MPmriXVeWmpdhUxytXtgwGPl+IOXlvpFBDLmEz9HIpxmA+93y10j
         Myp3spfa5H1qFuDTnIYR76QPZSsXthgj5vdRnZS9j2RhT3Ea1UrSDRO7KSeQNzN0jjsJ
         AP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783281; x=1796388081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6sjtzia/9qVvozEkPywWapR6k1Ealc6KRJ9DwbhjUM=;
        b=Rk80WxGFW6g5OqJHOVUqIwbbHZ3ZPg6n3A6Frh/RYu1ehGJ8l9smJmFoooymR+3qcG
         kFyY+GZ+goEjNWF6GRHAAX1Ppn93JnMmZkcg0/5/JR6yUIuoZmDVSrcakQtgHhGCdFWe
         JwuPEJxAAmpuKO3RwG7hI+SusVh242EV/FquTmOFLYTroZ1MD+ZRvFZQWs951T25wZzN
         SbwBkPmw+G0jyRgZRxAfCQQxERohRw8aLla11n3KvyFo9Xl/UuZ6AzfjWByHAmeYakYZ
         1IQr5HRAnkZHwsbCV5k/cTqkJ6BbHnEFmnH3JxpbC+AkXieis5z1IIzgEab+vRxYrAz4
         YWlw==
X-Forwarded-Encrypted: i=1; AL+hErHNWBQ5VPDPXDLBpFQZriI94WPeF+ZLuR+uKux8D7zW6Y7Uf4PGvICiOyelNgT9PKYcC5NU2sYIONCVcgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IDUGbfFk/ybk2YkDVr0NynjM+m7efQTaZKIZGMtgDXtM7+FCj
	Ww7GZencyxEBSI1Kl5nILKGW70/H1lbNK6+qy8KfAu8JeBfY2tmLWQHArpetWa/Ux5XWNzQscew
	LGOag/p7FmeTUhZ8PZ5C2l+AwspGrFoJn3jz8HtUP03F/gGJSbpavlCi6HnBSz5LX4g==
X-Gm-Gg: AZFdTZfNBRvvGHdr/DHyln92YMd6HHszXDhycJohNZnaPAovm8jCjO/zrrfhgtQT3Ug
	nM2bUw8M+W8+oznVG6a79ZfjIEEfdymU72T9FD/s1uEOrD968XrrcDpYdcLbK2fjVx/erqFjFli
	WMDeV78QU386fb+SwuW+li/7cF/jTgYWQLtyWaZZX0EblfX4H+kKpXe0xoiruh4V4RebwXfZrSd
	2rpj+cz1kiKG2lT0MNWbldf8R0H/ftebbpRz3QjqrF0F18DNL7I5qjX5ruozOuLwizbqeXAQvjA
	d1uz6M3W4j99HfRX5foScB6UdlzDPoAqWJllTU7JmTV0xwb3CF34zhgpBsr6X0CJNIfIevtjWi/
	NE44CinxiT5p+9PiZbcNZLB7uTL2N1d2xjy6PlrZy8j1jrTkcKya8ZhAd3QZrlt0EteVqlFVZUp
	vr/99T7s4F+uqSP1hhXEYO
X-Received: by 2002:a05:6000:2607:b0:48f:bb92:c5a7 with SMTP id ffacd0b85a97d-4abb0c5d665mr48588272f8f.9.1795783281260;
        Fri, 27 Nov 2026 04:41:21 -0800 (PST)
X-Received: by 2002:a05:6000:2607:b0:48f:bb92:c5a7 with SMTP id ffacd0b85a97d-4abb0c5d665mr48588225f8f.9.1795783280861;
        Fri, 27 Nov 2026 04:41:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm53695095f8f.55.2026.11.27.04.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:41:20 -0800 (PST)
Message-ID: <ba9b59dc-1e4e-4a59-8354-e4ec0de4ef1d@redhat.com>
Date: Fri, 27 Nov 2026 13:41:16 +0100
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
Subject: Re: [PATCH 1/3] drm/panic: Check QR alignment centers one axis at a
 time
To: peder.bergan@gmail.com, Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261126-perf-drm-panic-qr-v1-0-51856937dc4d@gmail.com>
 <20261126-perf-drm-panic-qr-v1-1-51856937dc4d@gmail.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20261126-perf-drm-panic-qr-v1-1-51856937dc4d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 17:53, Peder Bergan via B4 Relay wrote:
> From: Peder Bergan <peder.bergan@gmail.com>
> 
> is_alignment() scans pairs of alignment centers each time it tests
> whether a module is reserved. At version 40 there are seven centers
> per axis, so a lookup can visit 49 pairs.
> 
> Each center covers a five-module span, and adjacent centers are at
> least 12 modules apart. Find the unique matching center on each axis
> and apply the existing finder-pattern exclusion to that pair. The
> lookup now needs at most 14 center tests.

Thanks for your contribution.
This code is executed only once when a panic occurs, so optimizations 
are clearly not a priority.
But this series looks good, and keeps the code simple.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
> ---
>   drivers/gpu/drm/drm_panic_helper_qr.rs | 19 ++++++++-----------
>   1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_helper_qr.rs b/drivers/gpu/drm/drm_panic_helper_qr.rs
> index 4941731fb60fa..c6ed395c05bd2 100644
> --- a/drivers/gpu/drm/drm_panic_helper_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_helper_qr.rs
> @@ -746,17 +746,14 @@ fn draw_alignments(&mut self) {
>   
>       fn is_alignment(&self, x: u8, y: u8) -> bool {
>           let positions = self.version.alignment_pattern();
> -        for &ax in positions.iter() {
> -            for &ay in positions.iter() {
> -                if self.is_finder(ax, ay) {
> -                    continue;
> -                }
> -                if x >= ax - 2 && x <= ax + 2 && y >= ay - 2 && y <= ay + 2 {
> -                    return true;
> -                }
> -            }
> -        }
> -        false
> +        // Centers are at least 12 modules apart, so their five-module spans are disjoint.
> +        let Some(&ax) = positions.iter().find(|&&center| x.abs_diff(center) <= 2) else {
> +            return false;
> +        };
> +        let Some(&ay) = positions.iter().find(|&&center| y.abs_diff(center) <= 2) else {
> +            return false;
> +        };
> +        !self.is_finder(ax, ay)
>       }
>   
>       // Timing pattern: 2 dotted line between the finder patterns.
> 

