Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100719;
	b=hZas8VwXCKIV4J9+qw3hFf0zN140SwFWuGq7eSSu+1f9VyVmgcSCifdkwZBWGj1PQX/w
	 gXd9t8ZaqvMgr6x8jbh5lb3WXt0/GhBz7VIlfCdkgUGsL2afwUxWwBhUKBuMlLzSiRwOC
	 jplOrk23QkcUbLcI7ZpJwp5IpTAEPzjSznDSx/cJpAW/AQBGhpTiwcMtf8VPi7J9wrosO
	 gW0X82jHzJl5bYbGJemjZSZyiHG9dgGL/Obz8PFXxU4ytDFwJQAJuy+MyYDS1b5/H6SFV
	 WHkn5yayu1DseMhliHrRiNfidWKBj3E5iz/NU095sSfamoDXATkCTV2l6fxspKKLeiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100719;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cra6Vs20NtPqxX9EfP/IC1RWThkucYohNUCRfJABY3A=;
	b=fh6ACta47TuKvhbGVyqnpafKnIg/tvgJvSIoC+IkmtCLxof1ZbmyRm0wrVmFSlt2urbv
	 flzR6jEIacSBBB8oM/bbqlT0S5PNuQ1wZi4Tt/J8y9JZgSDYEETqU+aPC0ausAMFRWhLj
	 bl0w6DnYP2cDM42bPxVrrBpSrvTR0zgRzXDNCs1CNuzsfO3MpteWBhPh0OD2HuiIuOxQl
	 N2TbLLAxZVFrXMYFXuXlv0zxNr5/+hCzW67fnbgzk0lgdaHmo45tdpzcxaoy28X97P0t6
	 syg0FolUv0yZcocmILsr02Hs7Izs3s8jKfjpSn2QS3O5DGAv8GetMfHvrmUBzfHEmSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bpi2vh60;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="M/u5pjsP";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBC6606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FBC6606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bpi2vh60;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=M/u5pjsP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795100718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cra6Vs20NtPqxX9EfP/IC1RWThkucYohNUCRfJABY3A=;
	b=bpi2vh60xpvl5EGhMPTXOLvzgPqZZdGqCg0GyCAFSeHYeMAe6OtDarzKONIDkq2ly98yvc
	6MoKM145XOgKQJ5aVO64FHJq4a1zkKRwcRzmByXB77VwR4+krIe4KvTCLv4/C/QdiWCYZY
	fT2mC2fHWmYoWlLd7toKJcVDqYCsrDc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-KvBN0ajOMzOUDUqVEmU2Vg-1; Thu, 19 Nov 2026 15:05:14 +0000
X-MC-Unique: KvBN0ajOMzOUDUqVEmU2Vg-1
X-Mimecast-MFC-AGG-ID: KvBN0ajOMzOUDUqVEmU2Vg_1795100714
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-490c1867460so1478217f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795100713; x=1795705513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cra6Vs20NtPqxX9EfP/IC1RWThkucYohNUCRfJABY3A=;
        b=M/u5pjsPyc/9N48N/0EssEYRJNakgsn9YHzqC55V6mGYpInsHPPwTiFmhSBQO/BNZV
         47Kpio0IOkENBcK9jv3h+/TjwnmbJ2XGS0YtNGeWAYwhvdPzkgGuyEjhWabd4gma47rW
         i2eUQQSi7w0yJ2Fi/tlkxRAXz6GKQNJi2/ljwIsdjmFgBclryKidDJpR+gwmiBh0HW2o
         dsKTdRjIvuSYyb2z6vL7dtmSrF+B96YFT+sVc7u0qKw5xxvnY1tyBxtsYsefkJXSf8/C
         uOhND8uVg4zZEtSa+qnHT/eisLZ4jO9wuU01H4loGp/MneMJHowW2nIWRIvykEkgWaSz
         eigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100713; x=1795705513;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cra6Vs20NtPqxX9EfP/IC1RWThkucYohNUCRfJABY3A=;
        b=A13DE1paqnFyFV8eYyJIKXq+8KUq3q4Uzt6x1bpvm7X0j5TLjVV2zCKY4JotdJu92r
         T6Y0ko1ZADubPHJl/NvzmMQmfS4ZNxtX6Gaae/8KGN3Sp2aPAqKmY+hS+O1a2rxtbd9u
         6+q64wWooJou1Lqp865MzKwiB3u0i7pEPRk5M4F82Ogt23Pl0EcqSZaaRxpKP4gCnl9E
         oRTxPCm2MBvauqnDa5fh11Zlu2luyT77/IdfeYpMLit+dJYZhmBF0gjW2F0bi+eeGHWv
         Otx7ur/aCV1aPrvH9ue7hgliUYPt5pku8vKqtJ1sol8/eG9UDfnP/aJAEr/gfLYwE8b1
         Tp0Q==
X-Forwarded-Encrypted: i=1; AL+hErGtQ+n46V2MXeV9Ldemm3nuRgIfIQxWMSG+Pf9t92M4smyFSZtz0hgUe0KJuaYqKQuzkW3axzjYioGKOlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+CxswW41Q9PnXGuJHSH6HjwQnS8lpehUp+eYm4vQJOD2zOLAr
	gB1oowaKCnVyVTgXnTQMGfKNaj1ggVTXl7Rnpb1hmfDRwA9OlkPZ/QYX2P2o72dK2CP6rwJP3Ws
	kpeweOKbsyasRJeP5sapuWKMB8F9xVbMg2/ZL+xms95lUtlb/VWeEF7wRI1HOpRAiDg==
X-Gm-Gg: AZFdTZfcWHgFg8+kla7M0TQNxVVdhVUw1913zUJS3aMOSPgGlayJkLiCYMd0YBWE3NT
	ojvkmjfuIsg2xnPk/CxfnfLD+scdOiHSpFqB97p7TjXUYpTSKkxZNg7dYvMTTl00x6FAJOwCBu+
	hy19KrPRLGxoKa5dEZRXomJADNMfCoXlfmn6WUgR+lLK61M+HHhqW4gTqOwrlE2dom8YPh4kpQs
	eJ4jFo2LllFRmevjzAaYsd2VpPW+h1u6dv+/0mW+6DApR47PvZ5EFTjOGgk3+90xxvgKvFOln+D
	YYKQln+kEcHvJt1PYb46mAidNu/itRyzrEJaQamSDxscmmvT0AmgQL/sX92IQX4BfV+npYzF8g5
	SO2Al40zegCSocob+y84F9JI4s6u3bJs9PWzrahq8Bg==
X-Received: by 2002:a05:6000:2608:b0:4a9:2728:fdfc with SMTP id ffacd0b85a97d-4a92728ff7amr4686423f8f.28.1795100713357;
        Thu, 19 Nov 2026 07:05:13 -0800 (PST)
X-Received: by 2002:a05:6000:2608:b0:4a9:2728:fdfc with SMTP id ffacd0b85a97d-4a92728ff7amr4686266f8f.28.1795100712535;
        Thu, 19 Nov 2026 07:05:12 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1522:6500:ac93:c62:f076:48c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61e53asm61225f8f.59.2026.11.19.07.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:05:11 -0800 (PST)
Date: Thu, 19 Nov 2026 10:05:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej =?utf-8?B?TW9zbsOhxI1law==?= <omosnacek@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	Scott Branden <scott.branden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Richard Cochran <richardcochran@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	linux-sgx@vger.kernel.org, selinux@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 14/14] vhost-vdpa: convert mmap hook to mmap_prepare
Message-ID: <20261119100450-mutt-send-email-mst@kernel.org>
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
 <20261105-late-2026-mmap_prepare-v1-14-c56aadfbab8a@kernel.org>
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
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-14-c56aadfbab8a@kernel.org>

On Thu, Nov 05, 2026 at 09:05:45PM +0000, Lorenzo Stoakes (ARM) wrote:
> Move from the deprecated mmap hook to the new mmap_prepare hook. The hook
> only validates the request and sets the VMA flags, operations and page
> protection.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>


feel free to merge with rest of this.

> ---
>  drivers/vhost/vdpa.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index ff7d90719171..993b2d7c8927 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -1573,19 +1573,19 @@ static const struct vm_operations_struct vhost_vdpa_vm_ops = {
>  	.fault = vhost_vdpa_fault,
>  };
>  
> -static int vhost_vdpa_mmap(struct file *file, struct vm_area_struct *vma)
> +static int vhost_vdpa_mmap_prepare(struct vm_area_desc *desc)
>  {
> -	struct vhost_vdpa *v = vma->vm_file->private_data;
> +	struct vhost_vdpa *v = desc->file->private_data;
>  	struct vdpa_device *vdpa = v->vdpa;
>  	const struct vdpa_config_ops *ops = vdpa->config;
>  	struct vdpa_notification_area notify;
> -	unsigned long index = vma->vm_pgoff;
> +	unsigned long index = desc->pgoff;
>  
> -	if (vma->vm_end - vma->vm_start != PAGE_SIZE)
> +	if (vma_desc_size(desc) != PAGE_SIZE)
>  		return -EINVAL;
> -	if ((vma->vm_flags & VM_SHARED) == 0)
> +	if (!vma_desc_test(desc, VMA_SHARED_BIT))
>  		return -EINVAL;
> -	if (vma->vm_flags & VM_READ)
> +	if (vma_desc_test(desc, VMA_READ_BIT))
>  		return -EINVAL;
>  	if (!ops->get_vq_notification)
>  		return -ENOTSUPP;
> @@ -1598,12 +1598,13 @@ static int vhost_vdpa_mmap(struct file *file, struct vm_area_struct *vma)
>  		return -EINVAL;
>  	if (notify.addr & (PAGE_SIZE - 1))
>  		return -EINVAL;
> -	if (vma->vm_end - vma->vm_start != notify.size)
> +	if (vma_desc_size(desc) != notify.size)
>  		return -ENOTSUPP;
>  
> -	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> -	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> -	vma->vm_ops = &vhost_vdpa_vm_ops;
> +	desc->page_prot = pgprot_noncached(desc->page_prot);
> +	vma_desc_set_flags(desc, VMA_IO_BIT, VMA_PFNMAP_BIT, VMA_DONTEXPAND_BIT,
> +			   VMA_DONTDUMP_BIT);
> +	desc->vm_ops = &vhost_vdpa_vm_ops;
>  	return 0;
>  }
>  #endif /* CONFIG_MMU */
> @@ -1615,7 +1616,7 @@ static const struct file_operations vhost_vdpa_fops = {
>  	.write_iter	= vhost_vdpa_chr_write_iter,
>  	.unlocked_ioctl	= vhost_vdpa_unlocked_ioctl,
>  #ifdef CONFIG_MMU
> -	.mmap		= vhost_vdpa_mmap,
> +	.mmap_prepare	= vhost_vdpa_mmap_prepare,
>  #endif /* CONFIG_MMU */
>  	.compat_ioctl	= compat_ptr_ioctl,
>  };
> 
> -- 
> 2.56.0

