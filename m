Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101428;
	b=JsLKpdrdQJVd0T7Vp0GLQWGWAelzH5OYw679O48nrhN5XxuH16D6OiZylTGC5I8sJoRv
	 9Vj39hVXUDdFn3JWL7tXpJjC5lVzqZrKfIYVFMAi1JCZwhfwGlZRWCP5NoAAPgODyvxKE
	 NlsFZIP2P/QTX5F+FcucgiZFywdAbeK7/bVZ7ZHZSnomrNCDJSneWHDOWCmOp+YDcqyM/
	 xidEQ3UMMLFtpBuhCspUX/h2an/U5457j0w2uMSlDIJzKgdrlgO+NC7UyF39iMA82fWRo
	 Qtm8jcSqcpoSDzOABlVpQ1eM7S2ln5lutahh/4V+PYJkEy/kFeu4vF4G6wpthUINsMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101428;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mjCxSf15mAPakEhD7vh/i5/i7+CcuyVlsLkCJ9N8WsQ=;
	b=dAMGuUvyD1YIWDAkFsnHfXomhciJb1DAG2Md3Hj9sQeoahtf1DH4wL872PzBF8S0SP46
	 t2UT6ic2S0rA1xyyqbyhNzHd8GeoilMwDe7wni9IE6asfEtzKlQfi+K7FIypGlAioDhHe
	 ZxcJLKJV3FyXqsMC87iAgpyzJ2YVGG93xgWI9N4qjbY8nwMOVa5H6p1xre9ecAer4C6Fn
	 SrF02u/acTK1iFb05877MacJ8g8G2S8kr2lv2Ul8MwzAZYjwhfANujX6DNGdlalZt1T/T
	 AzB7+TlTTHVzN792pw3WgpJBfX6is1dOBDhAFrVcvbxgnBqugpupDq9Y/2T+ENu8cjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EXDMKD6y;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IUWlH+K9;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662A6606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 662A6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EXDMKD6y;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IUWlH+K9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795101427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mjCxSf15mAPakEhD7vh/i5/i7+CcuyVlsLkCJ9N8WsQ=;
	b=EXDMKD6yqKFvkXbYVx/MdSNdc8a+6Q90BNwrR2g7ckKOVn4s7V/hShdXN+KN46YQxBRZYB
	K2mwp0OJMdu6Wjf4ITxn2Fbl8968cXtYQoT4YpQXWAdooqAhfzKiohCHCvHiyYOKuWG4C9
	1dettkrgYMruBDA9zOOMFFzz4DqllSc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-5tle8kNdPnasRfzHhNc8Lw-1; Thu, 19 Nov 2026 10:17:05 -0500
X-MC-Unique: 5tle8kNdPnasRfzHhNc8Lw-1
X-Mimecast-MFC-AGG-ID: 5tle8kNdPnasRfzHhNc8Lw_1795101424
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bb66fc3aa6so24910395e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795101424; x=1795706224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mjCxSf15mAPakEhD7vh/i5/i7+CcuyVlsLkCJ9N8WsQ=;
        b=IUWlH+K9m4dAZ99xhZkMm66CDHfQQpuhK7inqhjwnJcph+H/r0YQE344/dAseahaMS
         xUjhHtovxFHAbvYsihdu8qXKez2hpG6v+4aOTHwuhTegH05gJgXbn8kjYS6MKVj3ZoS8
         n3YcE4lPOSF42mi5t6CjZsP4wiSSQJ7fObtAkqUSFrPdXyzGiQLdx1Zn2hyBAdUYsz9X
         nVAP1yu/Fl+CTeIZj0s8c1wpBdyLGkTR/A6x4e1sLPbFU4hSj2VHSaU2C5IKq16z/lJn
         sax/k0MDQBGfyXmTRfvh2qTzUjoGVbPov6Eh1dBsUD6sRi744WwcCdVTchlClgU9uNFV
         S3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101424; x=1795706224;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjCxSf15mAPakEhD7vh/i5/i7+CcuyVlsLkCJ9N8WsQ=;
        b=waKEhPHPBEzulKJZRLQOxu9K/MwNs8AZST3SDf6s4LrDRWebqb0ZQS4g5h3xrfhVo3
         ox9YiMOFzE2RD155kNmK7OVopd+mQYqYcvKGXumotta2lFWixAy/lj75JjL5CIFAJ7Dd
         GC1F/8mf+gPNxlNETT/nAjoO2a/qsHdBjKnCwUirHDYEFKhe5U8WJ4B1Q3NRKjOx0ZAX
         /0xakTOJwtcc3+9lqUsIEbe6fz/GrzwPX4UfnPosmOehzUm8xc0exAtwxsmPUub96hkG
         mLOCigFEKBeBGkb1AOwVTXBINRQ28TmOCCUshtFHXgjCPbqzIg8F5DK7xdRITOH/yqjy
         ZjTQ==
X-Forwarded-Encrypted: i=1; AL+hErFiCuTEojvcY4guHtH5CBztMdPVgd04H5coziOJ0DtgZ3YI8n1Bc6JJEmjn2nR2Op9wpxAQsuEHjiedx8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yatVxixd74w9ouZknguJ7XIb/TV/NoE2pa3l4m7l+V6ivv47T
	nVQ4XD+LeGGW6KEgA3xCj98NRwfMzzfYWLBgIt8uJj3+x1Tzj17FyzAKy5imgi3EM9jNNCn3qv0
	DnbP5lCoLONFYPdR4+uBoMxznUb2Q3iN2OnWWv8lx5mEVqiUfrZetsGER3u+BSgibPA==
X-Gm-Gg: AYBFou12qJdCnYAd8y7eTeOd85IwZ+DMaSQd6Vab6Zx6aUqEHQEAwXVGQbCmkIF0KX1
	Qr3IWo8r9iLBPaOmhhFCvmririAFVH/uEGCrqmMViLKf+zSO/+OjMSB079PZg6e4WD8rMk3Rcey
	GVvVPqByTof7E8G1lbxBjodE7JYuMUICfvWv1xqeLvYowxs0P04sbHkI1OoNJeiYxr5u4TOm1Vr
	WZZXjyhM6cxXGzaj4OJkgRqcaegRhgujdLf3hZVvqJO0hQVarLqK05T6M5DSYmBBQTFrsGEOlai
	QxcmUW/GtpSgb8Hu09P256a9ksUVxAXv3tRdpEUUGKNN+XA3Md+fTcCkiUbH1yJmsNkegxDW8kc
	82eCXmlBcLcU3i039keRST+/iNnaTYgJJFqG1Qc04YQ==
X-Received: by 2002:a05:600c:4583:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4bb7da2633emr133918265e9.19.1795101423922;
        Thu, 19 Nov 2026 07:17:03 -0800 (PST)
X-Received: by 2002:a05:600c:4583:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4bb7da2633emr133917645e9.19.1795101423444;
        Thu, 19 Nov 2026 07:17:03 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1522:6500:ac93:c62:f076:48c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e47177sm29776395e9.2.2026.11.19.07.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:17:02 -0800 (PST)
Date: Thu, 19 Nov 2026 10:16:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: raoxu <raoxu@uniontech.com>
Cc: jasowangio@gmail.com, eperezma@redhat.com, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vhost/net: Fix receive queue test in busy poll
Message-ID: <20261119101645-mutt-send-email-mst@kernel.org>
References: <005FA5F7354482C7+20261110051642.249640-1-raoxu@uniontech.com>
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
In-Reply-To: <005FA5F7354482C7+20261110051642.249640-1-raoxu@uniontech.com>

On Tue, Nov 10, 2026 at 01:16:42PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> sock_has_rx_data() returns a positive result when receive data is
> available. Socket implementations with a peek_len() callback follow
> that convention, but the fallback for sockets without one returns
> skb_queue_empty(), which has the opposite meaning.
> 
> This makes busy polling stop when a raw packet socket has no queued data
> and fail to recognize queued data through the fallback path. Return the
> negated queue-empty result so the fallback matches the callback and its
> callers.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>


do u want to send v2 addressing review?

> ---
>  drivers/vhost/net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> index 4570a4ffbab2..10ed2d55ff07 100644
> --- a/drivers/vhost/net.c
> +++ b/drivers/vhost/net.c
> @@ -538,7 +538,7 @@ static int sock_has_rx_data(struct socket *sock)
>  	if (sock->ops->peek_len)
>  		return sock->ops->peek_len(sock);
> 
> -	return skb_queue_empty(&sock->sk->sk_receive_queue);
> +	return !skb_queue_empty(&sock->sk->sk_receive_queue);
>  }
> 
>  static void vhost_net_busy_poll_try_queue(struct vhost_net *net,
> --
> 2.50.1

