Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205064;
	b=Y92vxLM/HODAQPn8r11LHfSNDNx1vG7QCEDhqyyr9kEqqWlxkrRkfFxdcF0RQdKa/iU/
	 rtzsVJoNFTEqn/lGZr+FUdHZwBZ65I4/AG2uFBaq3eEWiTqrKR6gewbI4G82gxGAJ8EBT
	 6ElAqw4b6D3wui37nmgeTVZGufRSq3w13KIJdE/J08t11bVZk9U7bkfnRRHVWtYPwXzp/
	 Tntfr6vzo+Nfax4hySSNdVYIj6k/iXdRGYf7jwv80FXQ11yBTCUv/iRDOp42r7FKtpjvS
	 rwJOXdg0M0HhOuG/W0VHLp/vWMrmc5vFiU+vz+wp1+3jD0YIq0bBs+FClBDpt06QVpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sbS+kHys+ZROW4VWeSHfOuIQU9MpFrnjpn+wgap+dRo=;
	b=w6miB5ova4Q9fIJ4t5WVeUamo0BfkePZz1FXApGjthUuJd5wYrZky60990KoBICj3adC
	 BBdpLX6kWbEMMOYOJGAl38HYYbzrvXwOuOJkdTLzPfTwBgxVc+wgqDoVbCp7spx9byECA
	 TqOto1iDttsnAt2NuO618F+Xo668flNn2cUP//a1QpkwuVd8jMKC619wuAQTjEggqCY/l
	 7Vf9fGF7pbZkvJUgqeHi6GXqwvU5M6FokuMbG1vEHPWcJ9Tr2waGMPIsxTeerpOEBVJ64
	 pJ1nEo02JkULvs1Mk+HdvWrvtHTj3cV8LRFrJARwWziu8Os4a/obz2nAD5d6TikuoZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y1gLO9ms;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7A8606A6CA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C7A8606A6CA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y1gLO9ms
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2efc4a84e75so13575ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795205059; x=1795809859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sbS+kHys+ZROW4VWeSHfOuIQU9MpFrnjpn+wgap+dRo=;
        b=Y1gLO9ms2uk47JyJLL4urGuQlDGprudfYxmNFtIMUyOdXQl5BHlPmeFEb6VwCM4wEq
         BzDX5PAlRSPHWjMrf7/SyYjwG/94DJIvS87663MjUxP/N2iwdXOs0bDDC51V50o2OSGu
         abAcxLsCMUlJiWhY92olOQdtZ8EwIys9tWacPWBJSF2uWzd99/McipXqKxtoDRKJpBZS
         uEQrMsJxHGnzc2YYtMoc+sWk51XXIcJqYujEb9EDHiXuViM30t92yi3gn8q4q6o80VaL
         73U/ZVchOLYrA+Z6tBTWi9oSysOVrzE3g3vJ6ExsLe4CWvkCnZY9I+KF8nTeAG2bmQsE
         Y02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205059; x=1795809859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbS+kHys+ZROW4VWeSHfOuIQU9MpFrnjpn+wgap+dRo=;
        b=U8jI9tFo9ZJ67+WRUBGjRLcYab7QddseXm1W7F8lBLYmbUw6PlEniNkRktnEDqYMlx
         TCmZ/yV76UKMocDQmBVu5tqsu+BQlOjENQYKoVrHS8lK8CTUNuLc+W1kS7Q2s2i2jaMf
         y8Q7GIBLTKIft5tZnTnW7c4KmkCkiwgo/cd1btxav/18/3zoPCoxk2C+8OskSJRix+69
         NS5lQ9CKyqOnWHRKOafA4JASxsfwNO+lVQiF3Q9JJPg49QA9eSShYCqwWfGkZBUISENe
         /FNOTPVUiZ6w9axdj8i2tyi849M+6h1m+88fQfrU7cEXQdAjJl7yB2GSESOtNSHObdIh
         Yl7w==
X-Forwarded-Encrypted: i=1; AL+hErEBkE8wvXQ43YBgQQQf8VlthSaKqhdEDnjZ6aNJvJ7xF9xSTsh9oUA/C2tWP4WNeyav3J5it9u1EeoX3EA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+962MXaezYJI5s+8PQpG5w6pVPVaFFxr97Mt204S9IPdKo5eQB
	8wNtERr8L/GyRRLht73Q5SCZP4USGeKoWHvrhUy2MkqE1o8aCMRH2uzOMDFD3OQ4tA==
X-Gm-Gg: AZFdTZcDzrlLiR3CP3Uyu8YrkQ5ra0J2O1DJ2P4A6pweDS3r7Y532akzpr067t9tYqE
	WpmtPClDQsDdRj1blmX7MUQ6vAEzEFMrEMnwpK0OyXzrAXQdXhOyqMBwN+DLzhVDgLvvY3le9Hm
	MIAIjIbT71olxrgRL7NIfI/+urSAZPaGc+EtZUaxD49j8KawZ01CCtGWAFhq0/cQhputgk6ajCZ
	TuUpkjv21BzL1OV1oYCG1iv+vOXtzvKcKWoaegdMTk8IsikBoV5djYDKekRHnq5u4AwZ2pljNHz
	Oj5POZJYbMqozgy9i0OJlYj34kDzfXWZzVBVhDjuJjC/8XZZzW+ZwMUqrYrFQgPPSb806/iHQ0B
	eF/A4kHplg7wZ2t5Y1UOmqf6idw6ZKOowvcYxphXi3qgxHTyzEOUq4DgoW6fNr7Rf14kucBlYPX
	BlYP6AKN9vvVFsDlQ/RMjvXMHzNXC2Pzu+5vFTE79kDx4q7z7CR7DxzpexSoZHs8LdVdyLx/art
	8PV82J35t9WBerzYiXUMmg6VOC2l2bz998QfzYalNx16yS/05MsowSCXzzkohkUivOSr5D6aJkT
	ZhlBnFRf55AfNoDCveDZKyd5tM54qmj04AZBUXz9wqBehn55bFJxWv8eH5oKY7nnl1T32RqyaWd
	N5kDZ6k9s/CODi/jJ2gx4Dw==
X-Received: by 2002:a17:903:1a2f:b0:2df:42af:2f9f with SMTP id d9443c01a7336-2f06244fc41mr646965ad.1.1795205058450;
        Fri, 20 Nov 2026 12:04:18 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm18409345ad.9.2026.11.20.12.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:04:17 -0800 (PST)
Date: Fri, 20 Nov 2026 20:04:14 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jiahao Xu <xujiahao@cmss.chinamobile.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, David Hildenbrand <david@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com
Subject: Re: [PATCH v2 2/2] iommufd: only hold references to files
 memfd_pin_folios() can pin
Message-ID: <awCntbf8pgcBZcg2@google.com>
References: <20261119163531.788514-1-xujiahao@cmss.chinamobile.com>
 <20261119163531.788514-1-xujiahao@cmss.chinamobile.com>
 <20261119163531.315791-1-xujiahao@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261119163531.315791-1-xujiahao@cmss.chinamobile.com>

On Thu, Nov 19, 2026 at 04:35:31PM +0800, Jiahao Xu wrote:
>iopt_map_file_pages() stores a reference to the file passed to
>IOMMU_IOAS_MAP_FILE in the iopt_pages of the new mapping:
>
>	iopt_map_file_pages()
>	  iopt_alloc_file_pages()
>	    pages->file = get_file(file)
>
>iopt_release_pages() drops that reference only when the iopt_pages is
>destroyed, which for a file mapping happens while the iommufd file is
>being torn down.  Nothing restricts which file can be passed, so
>userspace can map the iommufd file itself, or a vfio device fd bound to
>the same iommufd, both of which own an iommufd_ctx reference.  The
>reference graph then contains a cycle and the file, the iopt_pages, the
>IOAS and the iommufd_ctx are all leaked; kmemleak reports it as
>"memory leak in path_openat" with the holder taken through
>iopt_map_file_pages().
>
>Reverse the test instead of trying to enumerate the files that own an
>iommufd_ctx: accept only the files that memfd_pin_folios() is able to
>pin, which is exactly the set of files the mapping can be built from.
>file_is_memfd_compatible() reports that set, so the same test can run
>here before the reference is handed to iopt_pages.  dma-bufs are
>unaffected: they are taken by the dma_buf_get() branch above and never
>reach the file branch, and iopt_pages holds the dma_buf there, not a
>struct file.
>
>Fixes: f4986a72d6e4 ("iommufd: Add IOMMU_IOAS_MAP_FILE")
>Reported-by: syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com
>Closes: https://syzkaller.appspot.com/bug?extid=7666ed2c3d42196bf7e3
>Signed-off-by: Jiahao Xu <xujiahao@cmss.chinamobile.com>
>---
>v2:
> - Call an exported mm helper instead of shmem_file(): shmem_file()
>   became an out-of-line function in mm/shmem.c that is not exported, so
>   calling it from iommufd.ko failed at modpost with "symbol 'shmem_file'
>   undefined!".  Reported by Jason Gunthorpe.
> - Use file_is_memfd_compatible(), renamed from
>   memfd_pin_folios_supported() as suggested by David Hildenbrand.
>v1: https://lore.kernel.org/all/20261119104417.459962-1-xujiahao@cmss.chinamobile.com/
>---
> drivers/iommu/iommufd/io_pagetable.c | 12 ++++++++++++
> 1 file changed, 12 insertions(+)
>
>diff --git a/drivers/iommu/iommufd/io_pagetable.c b/drivers/iommu/iommufd/io_pagetable.c
>index 5ac736cf5..c9aad275f 100644
>--- a/drivers/iommu/iommufd/io_pagetable.c
>+++ b/drivers/iommu/iommufd/io_pagetable.c
>@@ -515,6 +515,18 @@ int iopt_map_file_pages(struct iommufd_ctx *ictx, struct io_pagetable *iopt,
> 		if (!file)
> 			return -EBADF;
>
>+		/*
>+		 * iopt_pages keeps a reference to the file until the mapping is
>+		 * destroyed, so only accept the files memfd_pin_folios() is able
>+		 * to pin.  Any other fd, in particular one that itself owns an
>+		 * iommufd_ctx (iommufd, vfio, ...), would put the file into a
>+		 * reference cycle with this iommufd and never be released.
>+		 */
>+		if (!file_is_memfd_compatible(file)) {
>+			fput(file);
>+			return -EINVAL;
>+		}
>+
> 		pages = iopt_alloc_file_pages(file, start_byte, start, length,
> 					      iommu_prot & IOMMU_WRITE);
> 		fput(file);
>-- 
>2.43.0
>
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
