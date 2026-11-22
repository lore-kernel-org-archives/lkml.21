Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795357549;
	b=1BxRaKyFcu0ryHJEItuM6TE8mbnKgl5sd/UuZixemYTW08JJg+6Zuc2T4KX8/omi6xpv
	 nplsmPVZn5a9nBQebS6LTXmnGrUto0d2Zh/xy9h0AZvGkBPvjdc+BA6HrQykB0d1SlOAY
	 HoDbMrrQNrCd7P3arFDRMgX1+olnJ4PjPhnJt7bdZYykIsCxjMHOKZesvagdf8+TQJrBG
	 sUoowZ8ZL44mxHfY9BbPG6kN0pSuq6HmKZ2t+8vGfn5oKFKjH6WB1uDw9swgtm33X/CQt
	 pV9TmY7q93sjfLXEjK2oSXfuyp3bUTdmNFfmmbN9Og8b/lLDKuZPdVMhVSg3bC0Pq9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795357549;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LW2QjvXtN8ArARJ6Dwfn7ixNOLbHAf2rUk+OEdDzONU=;
	b=nNKt8P5/J2YR7fnoavgvf+kaMcUCUsoATAKh+YP7FTF04gG6joq/mpsLFUim6VdgraKi
	 Q04XEpqpMxGp6R2IC2wQS3uI7K72tEeF+nR7qWzpDcx0YLrc7z1gcse8UCTQBI/XfjwBc
	 TazMJI3yEn1i838K7/Zk2hY47ZLeURFxYrQFds2tOeRg5wMqBseGJT6/nd4zJdFWEePHO
	 AL7kyM5xoBc3ENT6XAZi9GjDaAnN5hZJcuvl10bqHJgemmwN4SM4KWBsqQZXTvtDmQWAQ
	 km50iL030CgDkGi2gapYiDC6nLRMX3a+msySV+0cOEdGC0Mp6GHfWLCPWt0Z6CwpAtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="UR/qljh+";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RjmK1+iP;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A63606A680
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85A63606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UR/qljh+;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RjmK1+iP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795357547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LW2QjvXtN8ArARJ6Dwfn7ixNOLbHAf2rUk+OEdDzONU=;
	b=UR/qljh+xe96Qc+Fq3q91Ogousi2qq3xe7raEAwZteqqqlCwCUfhxb9C57CGIcmc2krnOl
	3qG1+9eMPIiO9m0+O/qsvpbwEr8LafaV2v4fS+PJhLfuw1nMaMYbymDL08mL7P8l7fnS2o
	66yQszYSh56ou+iA5XheK6DNvoGObkY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-UUXVY9aDNi6k3rkYIh3uew-1; Sun, 22 Nov 2026 14:25:43 +0000
X-MC-Unique: UUXVY9aDNi6k3rkYIh3uew-1
X-Mimecast-MFC-AGG-ID: UUXVY9aDNi6k3rkYIh3uew_1795357542
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e29c25101so976095f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795357542; x=1795962342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LW2QjvXtN8ArARJ6Dwfn7ixNOLbHAf2rUk+OEdDzONU=;
        b=RjmK1+iPYSd7kHyy0tJDRj9S17VyfTcMukIkM7MzAGf2d0rRNITym1te3WevtWlhHr
         HbckHHwtnTn9i+Q+NMshydqHWZhd+dztbwjqS8rC/dVB4C+ePqN+IGCHKG18hFg53fL3
         e0FaV/WQGpI0ShjPDMqqdEW8Lx2wYDmQSBreD6L9ukv346GRG+pkZfbNxHIjtwGJZikN
         98LM84lB5wbpFLeIeBjR2AjfxscgodYM32ZSXr/xdTGHkRnNiJDZ2DH5oc9IURrak1Kd
         rAdClAtGndNIUE4uZoU7cLoJgtuhX14HctSnCAhm4XhzSP1ONXkfYM1+/6mKpfEtmDHR
         8c5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795357542; x=1795962342;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LW2QjvXtN8ArARJ6Dwfn7ixNOLbHAf2rUk+OEdDzONU=;
        b=NXpVf/nguh2rs+lSsPmDjiZPUC+H4slGskvdIs/oRzlTcx2RbsqntE/2dFZAYuf6c7
         faVyKrru3vU8cibaNYnNoub4dTb3rZ8081cdcfAePerBIQFmiQ0/LckJDEoxthWEsoBi
         JdwtSQIH+Wj4jqGstCP+aNpBu+S71qw6xf/d3DB0a+MuDpE4lRCSp1/w6A5xFP/7AJEn
         xuP8+BGlinKA533lUQGMy8moV92OYrBQyZIK591V130Ntt2NAgqw/j2gBIIBMIutLtUd
         D7qlBJ5rtjK55Xf5ITFrz0eaTftOWxVCSdnOTss0Nr8I4eUE1xAr+C/TtOti/2v5H/Xv
         Eg/g==
X-Forwarded-Encrypted: i=1; AL+hErHAlcw9jZ/m0a5RQjv8PbGw6dbvfYUwYJ1tBtOMzSh/t/YW64guCEJ6GcaKM+cPSugDgwuAwkIKiKXF1D0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t4ZEXkW1qxLLcINy5GlEEIHsVPem0VUc/OKR7wyBVm+QoqLoD
	KyeHOeDBKFhMyRCqIByJZOseMCZez1Ku/oKCvwOr4rP/k4G9SRzzM/Pxdoenr67fuSqiMi3si+H
	B38Mfza5cP4LIZEp5J0lwI84JTBNUGpNTtgGeBHtsf9/qQgiy6BPGajnU/WG7HEhuOw==
X-Gm-Gg: AZFdTZckl0C8onxDycoOwfOgAZnJ5jGKyfG3qEQAEfdkj4WFPNP3Ew3LfLotvHH6JPE
	K05VQsPiBYnRH2mCpEVouRtLkxFZ8gI6gdvmD4j3ssL6jvbvZzPX5i/R4YQQ1LRKAEBpaQmdgBZ
	UmdaTjTJQZAAk7v/TcdXXiTTgB0DqQ/91nlXUVrnJp7O4M3YTtVxQ203URlSTH3u76TeLr4RR4e
	3KVDlNyTnIUY+EMSpG/guFUuGwYFQat1ZWtK6N+ix8N9xBsTkoRF1uUvVbd3xHsF+RlRmJNkGd2
	VBJ+EdRuN/7R4AriNFTsAqwRAtefhiD0gWiCbTCsHyg/abndbsxKv6LDQ5DzuRURQ9XfS8dW45j
	5xhyVs+UmJk1oIW2z+OcWJQJXMop2Y4OG9HWdvwT2
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr184853425e9.34.1795357542243;
        Sun, 22 Nov 2026 06:25:42 -0800 (PST)
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr184852965e9.34.1795357541679;
        Sun, 22 Nov 2026 06:25:41 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1524:9e00:c39b:a740:e7:3fcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm271466675e9.15.2026.11.22.06.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:25:40 -0800 (PST)
Date: Sun, 22 Nov 2026 09:25:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Paolo Abeni <pabeni@redhat.com>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] vhost/net: bound the count of VHOST_SET_FEATURES_ARRAY
Message-ID: <20261122092235-mutt-send-email-mst@kernel.org>
References: <20261122120919.1718445-1-hengyul@cs.unc.edu>
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
In-Reply-To: <20261122120919.1718445-1-hengyul@cs.unc.edu>

On Sun, Nov 22, 2026 at 07:09:19AM -0500, Hengyu Liang wrote:
> Commit 333c515d1896 ("vhost-net: allow configuring extended features")
> added VHOST_SET_FEATURES_ARRAY. The ioctl reads the number of feature
> words from user space and checks that every word above the supported
> ones is zero, one word at a time in a loop.
> 
> However, the loop has no upper bound and no scheduling point. As of now,
> a caller can pass a count of U64_MAX and a pointer into a large
> zero-filled mapping. The ioctl then stays in the kernel for as long as
> the mapping is readable, and a fatal signal is not handled until it
> ends. On a v6.18 debug kernel booted with preempt=none, two such calls
> from a non-root user, each on a 4 GiB mapping, froze a 2-CPU VM for
> 56 s with soft lockup reports.
> 
> Interfaces that take an extensible structure from user space limit it
> to one page (openat2, clone3, sched_setattr).
> 
> On a KASAN kernel with a 1 GiB mapping: before commit 333c515d1896
> ("vhost-net: allow configuring extended features"), the ioctl does not
> exist and the call fails with EPERM at once. After that commit, it
> fails with EFAULT after 26.0 s. With this patch, it fails with E2BIG at
> once. A reproducer is available on request.
> 
> This patch will reject counts above one page of words (512 on a 4 KiB
> page, or 32768 feature bits; 128 are defined today) before the walk
> starts.
> 
> Fixes: 333c515d1896 ("vhost-net: allow configuring extended features")
> Cc: stable@vger.kernel.org # v6.17+
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
> ---
> I found this while comparing the behavior of different kernel versions.
> I used an LLM to analyze the problem and to draft the patch and this
> message, and I analyzed the result myself.
> 
> Tested on the vhost tree at 44293796526f with KASAN and lockdep: counts
> of 0, 2, 3 and 512 words still succeed, a nonzero word above the
> supported ones still gives EOPNOTSUPP, and VHOST_GET_FEATURES_ARRAY is
> unchanged.
>  drivers/vhost/net.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> index 631855064b3d..22e06b44d2ed 100644
> --- a/drivers/vhost/net.c
> +++ b/drivers/vhost/net.c
> @@ -1795,6 +1795,8 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
>  	case VHOST_SET_FEATURES_ARRAY:
>  		if (copy_from_user(&count, featurep, sizeof(count)))
>  			return -EFAULT;
> +		if (count > PAGE_SIZE / sizeof(u64))
> +			return -E2BIG;
>  
>  		virtio_features_zero(all_features);
>  		argp += sizeof(u64);

????
this is followed by:

                virtio_features_zero(all_features);
                argp += sizeof(u64);
                copied = min(count, (u64)VIRTIO_FEATURES_U64S);
                if (copy_from_user(all_features, argp, copied * sizeof(u64)))
                        return -EFAULT;

copies at most 8 bytes.


did you test that this patch actually helps anything?


> base-commit: 44293796526f4343639f87b2acc53811c78b5d54
> -- 
> 2.53.0

