Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674476;
	b=FvaP9Z50eeVZZLzG0hmXKow9LstFcgRTJaos0D5KzE7HY0Dk0iBfYWuQBvscYVRA4qxA
	 3orOuAxIuhOsC33EC82T/+9EDc0Yoc0h4RuM8aYQYSyaZvExd4m6W21rCMsWMNPvJmiGG
	 phgBeHbX2XaW2SEyRQMHKnDmEUrY6++b9bw+9tXh2mPRw2Bo/pP4pQVG6ZcoiNgO135t1
	 Dn+JOS/n0cNcflSy6cHxti2Tswb3wEEQoh7Z4YAaF99b3syZjug/PFtjj9Dk5kdJgsk+c
	 yt9NOYBm6TVtx43V2G1FgPFsuSa5Y9o2tCxn8adLXZOI1xhMO96kXCltJ2BVrpnw6fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674476;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UtfGcVjhbtyMbWnMCWBbJdWulh+LbtmfIOwER82/A9M=;
	b=LWtxR+hDvOvu/48Rma2qCRPFSsTTWupNNCa/+CjoAjT/0LHLBomDP1dI2pXVbFwqQQEY
	 g+6HcMLf3bfrJJFHDKXss3Z9DYqj2gnlKlpmUIZGVAT6R27SRIvKv1gmad/tEMvi3ANW3
	 UEcZwULjHhAf8HYYOt0axprbxAFAzsD6EYcXHWOWERnKd+PvDhOiwl6IfB6e6pcoirYd9
	 dqYwSAnGpYfCE1FW43gbdWrfZ2iWkit2Eiu40EDI0JGPnKCXJtfDjZBhSyZgoSs6p5pLE
	 8EedDM5LBvYc3Ufkc5zWzPU4zSjGNWGhAFR2lBwZ0BMdimmjupYmnzIWxoSqWl+iatA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YU3dz5z8;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UsxCT3+v;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093CF606A337
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 093CF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YU3dz5z8;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UsxCT3+v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795674474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UtfGcVjhbtyMbWnMCWBbJdWulh+LbtmfIOwER82/A9M=;
	b=YU3dz5z8hxqa3dUPNuSS31CKO9673zsvf0BAhWEZS6/xpIgvzKUklILav7xry+r9tXMq8n
	B0EBl7XwOsPs3/iqi/eOGn+tpJDHUvW/ju5LZhUi5pua8fmBB/5BmrW2FBToVL1S+tQ7Qc
	k5uRmDLolmaFC+50s88hcvRPpWmBrfM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-RCX71qodN2S2Rbws5pvjdw-1; Thu, 26 Nov 2026 06:27:51 +0000
X-MC-Unique: RCX71qodN2S2Rbws5pvjdw-1
X-Mimecast-MFC-AGG-ID: RCX71qodN2S2Rbws5pvjdw_1795674471
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bb818d8dcfso32780755e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795674470; x=1796279270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UtfGcVjhbtyMbWnMCWBbJdWulh+LbtmfIOwER82/A9M=;
        b=UsxCT3+vcGpHo1FlQa5wibNzAz0XKjPBk9+2YofaI0NCCQsNsQm6kzCV36Z1yDQZ6F
         3obzY3PeE5b1wTTpin3eFYcQWixPWs425/MsW/w2K+R0kVxC1lMS17t2UaR9Lqc4mG+8
         IZKDJQJy9YvakuZaEnMFS1xFVtpWqAyNLdk4ZAukXt89HKh4MtAwatL6kGZz2BNd3wvm
         CwtvxQAJmITBj+G4vTmut2zK0Vi7SRnemSMCP36XQ2PGdz9ybeR0pvoHlj/QPxXxlCtU
         ge5qBKSjz47zCJdIDK82X+G4QxBYU3DM59pIq5tGlyPK+MsjcOGAa+nEfKh0KbIEpjcG
         f+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674470; x=1796279270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtfGcVjhbtyMbWnMCWBbJdWulh+LbtmfIOwER82/A9M=;
        b=OsHnYQIV/D6b/yhxaOfO9pH1EmHmJX1KvBSI8Tksko8UCdy11beLuJvlBZGtW3iKMT
         ruad8w4vrDYl5AsLwNI7zOtxxCgqRQh5s0Ds+DyLi6SsyXo8f097Ot54yPLcyzpY7c7U
         2f2NzKx0j19cc/z8hfsnkkB0zq1djUyTvQqo+4DM+zXV+Y8K+HyFqr/bPgXfoNP74cks
         byCtiHYdnbpmGsRgW2gG6Eo6w8HWQOHw1ZpOJKblJBvCQKtpjBeUe2AqzldHafJOHvYW
         NsAY6Ne2KyHr4oWkphtlofA3qF0JQLy5SIH8alZjs4VQrzpY64JKxxUbt0fX7ve/50oL
         xOEw==
X-Forwarded-Encrypted: i=1; AL+hErHrD0/XohsiXDDt3K1ZJNnH5RmzQts+CfoZTWoIXw/P+Kv+KyDlgVaeD8prDGD+7OHC0ryrDZeIBWE4gfA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VBBJRacNxGANFHKcKtv4xT2WYfd5xX2WJ0wCAKEkumAgkiTtI
	cJ1d2nfB3eQHjceumcm8OmqNZiYXan1e1F4zPZi/4XUS3YMwhZozVslPYrGCf17oABlkeigS0Iw
	5u1QnxTb0hXwQ8O0nTXqtN9/c56493KX292l9aJzkebFq5PUpwH2QA2fR7hi/QNMQ4Sr0PkePYA
	==
X-Gm-Gg: AZFdTZd7M31vINPcEUPHtV4N40CeXlofU5do1x8kyT/2YM8GeKpvdKov9EOSi3yIhM5
	jv0nAaWKqXNlugkrE5QPSLQxPK8zS3yPIEndcsKcx3TPPX+eoh7PMs2GC8DZEJKPbQR90NaqgBc
	R56PUSN4eisG1ZUAsGGQxzxxiuid62LPVZr2Wrpdc6Uy1vdWybDjKihufGECPaDErYE9+rHCWcV
	pIG4JEUZ/OWS78SuY1ipqbOgAP+1qtyR8tarhPmCxMFYmFLSj93Cstm4IKDrvSQLWwypz4DGUNg
	JF53uXlu+1rmumAJMeshfETRJfFbOrFsKl6wPuGR4S88IPvgHtGPBNbmwJfkVgrwerXf6+bBkHr
	g8VBW6Dv833HNvoxJyJhSXv+0p7YXnBmuHJz6W7Iu63Q=
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr405069315e9.4.1795674470479;
        Wed, 25 Nov 2026 22:27:50 -0800 (PST)
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr405068955e9.4.1795674470015;
        Wed, 25 Nov 2026 22:27:50 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1529:2e00:86ec:bef7:c309:ba1f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm44293956f8f.24.2026.11.25.22.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:27:49 -0800 (PST)
Date: Thu, 26 Nov 2026 01:27:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Flemin Jose <flemin.jose@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] virtio: Add vendor-specific device ID
Message-ID: <20261126012523-mutt-send-email-mst@kernel.org>
References: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
 <20261126-jshekhar-qcom-virtio-dcp-v1-2-7b49bda74916@oss.qualcomm.com>
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
In-Reply-To: <20261126-jshekhar-qcom-virtio-dcp-v1-2-7b49bda74916@oss.qualcomm.com>

On Thu, Nov 26, 2026 at 11:54:00AM +0530, Jayant Shekhar wrote:
> Define VIRTIO_ID_VENDOR with the proposed device ID value 52 for generic
> vendor-specific VirtIO devices. This allows vendor-specific functions to
> share one VirtIO device ID and be distinguished using their vendor ID and
> platform description.
> 
> The value is proposed for VirtIO TC allocation and must not be merged
> until the ID is formally allocated. The DCP function driver should match
> the generic device ID together with Qualcomm vendor identification and
> the DT-described transport.
> 
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  include/uapi/linux/virtio_ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index f9056af0c622..9a8b6a6a03a4 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -70,6 +70,7 @@
>  #define VIRTIO_ID_GPIO			41 /* virtio gpio */
>  #define VIRTIO_ID_SPI			45 /* virtio spi */
>  #define VIRTIO_ID_MEDIA			48 /* virtio media */
> +#define VIRTIO_ID_VENDOR		52 /* virtio vendor-specific device */

I am fine with this. But it has to get virtio tc approval or you risk
conflicting with someone else's id.
Please request a vote in the virtio tc going on this one and resubmit
once it's approved. takes a couple of weeks usually.

>  
>  /*
>   * Virtio Transitional IDs
> 
> -- 
> 2.43.0

