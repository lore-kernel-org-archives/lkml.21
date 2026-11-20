Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196137;
	b=d3frfZwhkPX/I0C/Gxj3DocBk6Yblt8qddscYQboHJBdHyuH+iVYq7xiFBjJyXJUMXWy
	 NZAcWLx+/zPGaxO6O7ObjjaRarXFqy3DUOG11FC7rtIi33hGHHOntvUxSIVTxf5vlmX25
	 kqsYNwtovpJ2RkA34L3DNmKe7JNM4SDxZYXYOuXQVIBiprg44P6gMeJMqVH4VeJxthDDK
	 MNtIdSLiV/JsUen4ainYMT8VZ+WhJNyqp3LL48t1njCeGqZ8HHuLNBnBuS9wWXziRSeSa
	 +MP6zRCFhYUpYnjS9aSfoLaJ/1bSOm2oMpkh0UBK1MbPrTQmNes67+LJb9XrF/n7vCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196137;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GegFZN/i+0Qb2Bxilr1Km+wa96tgPPaqqRX1nymM8Ts=;
	b=1kiyVfHdP172/VoFe/K2mPyfnjBjRwUhws4cZdDhddyJybd0KmSabmY1ei9XX9xmhL3O
	 Ebv1tH2/VvpFRgI3duzCOriSakI68S3P8wuxunRyuVn2y7yUjp6pu+9Dl8Cs/7C/wN9E+
	 CdLtYlOWKK7ifG1A1qm5zuBSfgwh/h//B35DKasg1PYZRJWeV1zjX8WmXFIiQnOfe4DaG
	 dSYbrgCXGny6vghbnn65CeSgjIWB4dPww0sqOCUy9j3tpr4eO7rYtg1EtI4WJ0ZMngkeH
	 LCwG8CU2NbWJQjPQNBno9uavd7hqPSsKbc4dU0daGrnsol/zeVuGgP5Xx4GHhwHi04w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DBNbd9vk;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EOwwV6yH;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8674160A2620
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8674160A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DBNbd9vk;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EOwwV6yH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795196135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GegFZN/i+0Qb2Bxilr1Km+wa96tgPPaqqRX1nymM8Ts=;
	b=DBNbd9vkNKfP5oVT2g3LUgP6Gd4cPvJHlB/xIiyT2QQ1sn/VlHZmuJ/vg4esRrqa1xygha
	uS9ovo/5NcBIu11vGBigNR/rOMgJcoUSUoUit2wUvizN1sQTPhjfp1N3MfuLQVIZ4vEGS1
	TNOoqMnOFu2YCYceZLh9GVgOS6sZmc4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-TqBNwKz3P_SBFacO29ZuAA-1; Fri, 20 Nov 2026 17:35:33 +0000
X-MC-Unique: TqBNwKz3P_SBFacO29ZuAA-1
X-Mimecast-MFC-AGG-ID: TqBNwKz3P_SBFacO29ZuAA_1795196132
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4923b9fdd43so750063f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795196132; x=1795800932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GegFZN/i+0Qb2Bxilr1Km+wa96tgPPaqqRX1nymM8Ts=;
        b=EOwwV6yHOp3apsf9f902opTqO03jNgptct21fISKdBBMYsOB9iC9vHmapSQQ+a9FZy
         X6x4k95HK5XM2UtpmKUEy9dtRhziogCA/BIMDRF6qcxPGcN48mQ0d2ud0qUeJDaR1rXq
         C4aDchRQ1xVo7IpLHtC7HJNj/tvfylG5wOKaWWou3tsIdeYGyRsQrySBm9SxuEVUVywY
         VT5RgKuKkGVlBiDL19m+W47kAyfU18xuyHMQZWIhhrhNNqPAodhQNgrdvrTLXBN88z0M
         30ixgFFlb+gllt1W87j0GOChYsVaYXghY1t6prcqoFruaDvmpsk/MNWlEJlf1TnBajxr
         NLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196132; x=1795800932;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GegFZN/i+0Qb2Bxilr1Km+wa96tgPPaqqRX1nymM8Ts=;
        b=Ka55/M66tn0wSUW3KBia+08YEfxvA+dVwj/0ehgOWrIfdp26WGtgacxvBRnSqupqcY
         /kieCOKTKXEiYIaqX70sRt59KkfeNPpKDfT3bcAdKsrkfKHDhv5LIclL0qa5KJyCcpGy
         Cgy2MGkLusQXw0Tc5lltsHZ9Xh/xNsHN397t05FgXtUD465riWIZZ/TDiCdvuQNdTluG
         16PyFKW6rTI/ni8b4F/NB6FFkpMJWIAvkPccb+5cNRhczw1AI7ZHRGGw1tDljfdtRmCp
         ncID5vNOUiBfEYL+fUHuBIBk6grXNXV9WRbqLiY5IfmNPc+g7CL08tKMuTe3G7xeRE52
         Yc3g==
X-Forwarded-Encrypted: i=1; AL+hErE8Kv88xhRBDlK3NHnceW4J5fN70EvwjEfsiNN1IzmBREVYWsLfVdG0QZXCzwSHklEUauvzxNNysFs8kak=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BsOrNZuHvcQPuy7BoV6XjcTmjCAz6bsvsE9EpFuIhZpBILHAG
	mwEz4iYx5UmGjINtYn/SsoapINEWeLWHJMiuqWdpdFsyO8PZYCqZ0pJrCknuVCVAMHJfzmf1gTi
	5ZqSKNzx+0gle44WDmKmiD3n64/ztFgii03PW/xAd+RveNaytvsLk4CMBRgtrAzBriw==
X-Gm-Gg: AZFdTZdQp2YFdkAvEC5xwJfNPQYDh6rPGxByOtcBQiPq4U6GcZ9qoCuq2wM0dIHL39v
	abfp15QWAq/1yUF4TNEEt2Q76tKp9t1PANcnkvHsB1aRq3w9Fm61549I1J4RNWd151nKX5246f6
	IaCLxbVpdUByQaWpExoce4wEasgKf2wskbcuEwv/qhJDtXcW8kXqgwJGWl2XXHmhi9wU9NKjjTu
	vJdMrjupChySmMD0foHot7ds7KGs1WJWFlLPUVq1cV+KMmUZMAIbW5KaozWeFfWgGX1JlJ//jzg
	spzW6fEgSubsEwMKqYebVRILvRs3O4ZF0ryrjYsjbI516lajGy+9xWh1Dmz9Pr6l7qiC6MG088y
	kELDrvKiQFjrC5FEML80WjBi/7K4Rl7FOzyVAFrbFpHh2
X-Received: by 2002:a5d:5f4f:0:b0:4a7:35af:c83c with SMTP id ffacd0b85a97d-4abb3e21218mr7875099f8f.43.1795196132096;
        Fri, 20 Nov 2026 09:35:32 -0800 (PST)
X-Received: by 2002:a5d:5f4f:0:b0:4a7:35af:c83c with SMTP id ffacd0b85a97d-4abb3e21218mr7875038f8f.43.1795196131642;
        Fri, 20 Nov 2026 09:35:31 -0800 (PST)
Received: from redhat.com ([2a06:c701:73c1:fd00:6c8e:5a61:f533:519d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm7150988f8f.31.2026.11.20.09.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:35:30 -0800 (PST)
Date: Fri, 20 Nov 2026 12:35:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Cc: vlad.wing@gmail.com, brett.creeley@amd.com, eperezma@redhat.com,
	jasowangio@gmail.com, jkkm@meta.com, kernel-team@meta.com,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com, joao.m.martins@oracle.com,
	si-wei.liu@oracle.com
Subject: Re: [PATCH] virtio_pci: limit Oracle DSC2-200 virtio-net to 48-bit
 DMA
Message-ID: <20261120123500-mutt-send-email-mst@kernel.org>
References: <20261109184253.531677-1-vlad.wing@gmail.com>
 <20261119200654.1048266-1-vlad.wing@gmail.com>
 <20261119181557-mutt-send-email-mst@kernel.org>
 <20261120171435.83458-1-jonah.palmer@oracle.com>
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
In-Reply-To: <20261120171435.83458-1-jonah.palmer@oracle.com>

On Fri, Nov 20, 2026 at 12:14:35PM -0500, Jonah Palmer wrote:
> On November 19, 2026 at 6:16 PM EST, Michael S. Tsirkin wrote:
> > it's in my tree.
> 
> Hi Vlad, Michael.
> 
> I've been looking into this issue extensively. The proposed 48-bit limit
> is a suitable conservative workaround. My virtio-net testing for this
> issue shows that a 51-bit DMA mask also avoids the mentioned issue.

Do u want 51 bit then maybe? x8 memory with no BB?

> Full 52-bit DMA mask support is planned. We will revisit the driver's
> DMA mask once the firmware has been updated.
> 
> Thanks,
> Jonah

