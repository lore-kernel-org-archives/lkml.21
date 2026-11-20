Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133779;
	b=4msxIttCMdxxhWKLNF/POZ+BQl9mycN4LKU562Cb+87DDqakoyGdPyMTgXrjJ92gaCT7
	 0Yqz5ylSjO+I4CTULXoToFUAjrojt2cl6+dvOHE3DTy93jcBN3ZidLemt19gblArfNzVg
	 sFg/IKIQwjJ6Ng1BsBxgtaVUjdkQgbh+Em2cPDnW7iI+gllfZ0b/qfJz1WZN89ZCngsfE
	 dO5ebfN8dif3kcKXC02i/m4RMwFM0udDyNYiTIN2JaKrE0+CaIURk+zeuxBDmNDnO9fID
	 n4MdNDObFvYpQ6YRMCsRlNzeRaPuDVed48wSVXWnPNhydE8CUjVFGHF/SACw2t51vRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=hAC07b8lFLojHV0Uml6G9ei5fnLsVAdumfXqcmefGN4=;
	b=VgPOHz1Q1TVcwbTkPiJW/310YrzLuUUAbt1NjeqgXpYlIKwJN5eluyxVKcPkKcxtYhsP
	 rb8Y1Zvlt2iyXN4hlfqwtgPGsP4oabhdwAKwDHkGHOHyqITUU4E/5dVrBc42Q3OPjXrao
	 wGJYWkynQMO4HvC4c5aB0/5kpiTBiya7B3rHlyp9Rad6n1guGur5ev2RccNbx8maGPTVt
	 PzEPYjUBw2S4tPpsWndvFtEih4SJmjJT0ctjNqdjRSsaqmnjRUJAHSGde1y21bv6ijm3s
	 +srf+6PYlkz/8lfj5j8bhrje4snnXYn2JkepJVvOqnnUxDWuIGZfRQR86JGjqV/fGnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YGxaXrD3;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E02D606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E02D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YGxaXrD3
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2efdbab4e03so1114385ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795133779; x=1795738579; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hAC07b8lFLojHV0Uml6G9ei5fnLsVAdumfXqcmefGN4=;
        b=YGxaXrD3nt6EPnZPTmgF4t/3KSyiOMN1+lC4rUXlqKhSSkNgz7z3Tw9defhg0JcLNz
         COBTxMkEo40/X8sRQdM7HVlPc4YBUI3BOWpsLwV/c+feWkZ+jerXEi5k9B1v4Aj35evN
         34MBgyEFqjzAAK+aE+r1l25v875SuA/dwjm66qDtp7iDEdwiA0p+BZ+mvYZYV55F1oPc
         ytJ6fNB2IkjgjHg7MtQPV87reMTxS9vehx9xnwzlWqfUjqDj2DcuXCbR7QemVG8EjrOl
         ViWGN5eNUOfh7oLjeYPYCv+//QPNGWVPjeqJ8hnRLVjPVuR1qlAszE5eQcyfvgAzj7Jn
         sP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795133779; x=1795738579;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAC07b8lFLojHV0Uml6G9ei5fnLsVAdumfXqcmefGN4=;
        b=o4JbmoIf048fe6HZ7VOZvH40eNwTx5+1DYwAIgvmnc6Tmc90MpgPVmiEr+zY1btK8p
         UpR6/i02CkkxnpIqZwBhPVKte81d42m3LK2UxHm08kBJttm3wB/O3sEneR9qmGkc/23B
         FgIk2ueg8dsTxIfwINrT+qM7XBH3NLLln7c8L315+xxOJOnVmALLS9nYi6TxWMB2QsDt
         n9cAFrCOBXleviT8QHUceWVmg5+lPnzbn/b4OdBMKnUJiX6Klzf7GkX493Td1kSrS5PG
         lNgss1S1spAVyiJlawiRtl+d+lazI82GGHVsV5majVHu3mDY9AAQFnCZkTEIdK6t7z6W
         9DQw==
X-Forwarded-Encrypted: i=1; AL+hErHkOmOH6N6d4wRJwkIpPA3Ez+R+Xn0+n5EyTFzfeS65adUAtL0q0GJjitQx5gTYjHtWS6vxkhaj7iHcMu4=@vger.kernel.org
X-Gm-Message-State: APuU4Z89591upf992LsaM9NDF8q5elcx/yXbz2YxnRFYrcoE91x/Q93d
	tGgOy1DLGZGqzlR/q84OKpwMT6L6xINtk267OqWmiBsVwLuZVsrHyJLT0Qruuxr38A==
X-Gm-Gg: AZFdTZcAuFkkuS0oQUoxKYqmX7sqAlyFvkfh0qn8WnTUTBCFbKJiFVfw9xrJxydmRb0
	5X/QN1+x10SJJeLB6Uic/dADL4CwhmrzDinc7kobqDUoZuYnk+nhAwU1MLQLoMTxEbd6/5/FHet
	WqX+3PvbbMrMNCVe8G6awCG6LBnhrDO46qBmEIM6Ro0lcIB67+ZJyjrI+Ax/uKcXD0rkxX4NKu0
	ebx0eT7wGLzvKxnXzMZie9NPpFjwNE6azoyraKdZFYX4AUfJRCxMT63mKQr7Cy+oxVgBodK0a6O
	AS7FcQUGz2h3XdzBoeeKY0JWz7xe3wnLEcbUXevAjrsxnEV8z5ST/LLXIdsBufV42fVc637RB61
	szSk1J8CYU9aHnp7sVQehyIoLolqyHCA+Jiu3v9fpWzI+wWpJTMNM4upxiKcCnZ5kKl+rHn20r5
	o02/kqHEAetgztmGNLVU4DgtQWwFNtjv5FV3fTR9+7Fdi8iwRwalVNQMkapjT+e8C/pUbobVBjI
	TD2Ml9qy0YE93iLIbnxZaLU86oefjcy3eU+b7BPOQ0NWu+vSnxdlipPHoZ1bsKnDmNcjm3qd1gv
	zHroqls9UqWWb3bzlPF6KbeHv9SEJ7Giz9RpNkdB/68Qv/vMwwfEP6thCCfBm/a0
X-Received: by 2002:a17:903:2b0f:b0:2e2:dfb8:818a with SMTP id d9443c01a7336-2f03f20f8c5mr14954585ad.62.1795133778058;
        Thu, 19 Nov 2026 16:16:18 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c6e50sm6072095ad.13.2026.11.19.16.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 16:16:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 16:16:16 -0800
Message-Id: <DMZLTC9U6DBX.3FR19X5M2IT3W@google.com>
Cc: <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <graf@amazon.com>, <jacob.pan@linux.microsoft.com>, <jgg@nvidia.com>,
 <jgg@ziepe.ca>, <jrhilke@google.com>, <julianr@linux.ibm.com>,
 <kees@kernel.org>, <kevin.tian@intel.com>, <leon@kernel.org>,
 <leonro@nvidia.com>, <lukas@wunner.de>, <mattev@meta.com>,
 <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 11/27] vfio/pci: Retrieve preserved device files
 after Live Update
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-12-vipinsh@google.com>
 <DMOAT4VV939P.2DI8CEOMMSKMY@google.com>
 <20261118065653.GE2250529.vipinsh@google.com>
In-Reply-To: <20261118065653.GE2250529.vipinsh@google.com>

On Tue Nov 17, 2026 at 11:51 PM PST, Vipin Sharma wrote:
> On Fri, Nov 06, 2026 at 05:19:28PM +0000, David Matlack wrote:
>> On Mon Nov 2, 2026 at 3:36 PM UTC, Vipin Sharma wrote:
>> >  * Open and return an anonymous VFIO cdev file via
>> >    vfio_device_liveupdate_cdev_open().
>>=20
>> Here's an idea for how the device file could be created on retrieve,
>> which I'd like to hear your thoughts on.
>>=20
>> The patches from Pasha at [1] lets userspace pass a
>> file-handler-specific argument to LIVEUPDATE_SESSION_RETRIEVE_FD. In the
>> next version of the tmpfs series, I'm planning to use that to have
>> userspace create the file and pass it in the argument, and the kernel
>> then restores the preserved file into it.
>>=20
>> I wonder if VFIO should work the same way, e.g.:
>>=20
>>   struct liveupdate_vfio_retrieve_arg {
>>           __u32 size;
>>           __s32 fd;
>>   };
>>=20
>> Userspace would open /dev/vfio/devices/noiommu-vfioX itself and pass
>> the fd. retrieve() would check that it's an unbound vfio-pci cdev file
>> for the preserved device (domain/BDF, noiommu, incoming, cfg_size),
>> attach the incoming state to that file, and LUO would track that file
>> as the retrieved file. VFIO_DEVICE_BIND_IOMMUFD would then take over the
>> device as it does now. Since VFIO preservation is new, the argument
>> could simply be required.
>>
>> What do you think?
>
> Overall, I agree with the strategy. I think VFIO cdev retrieval should
> happen as the flow you mentioned above. I want to hightlight two things:
>
> 1. This will lead to lot of code changes happening in vfio core. This
>    means VFIO PCI live update code change will spill in vfio core.
>    Should I create a config VFIO_LIVEUPDATE for VFIO core code. It will
>    not be visible menuconfig option but selected when
>    VFIO_PCI_LIVEUPDATE is enabled.
> 2. List of other inflight series that this series will depend on is
>    increasing. It will be 3 (reset function, pci saved state, and
>    restore into fd).
>
> For '2', should I send v7 without changes you are recommending in this
> patch and future version of this series can transition to the approach
> you are suggesting after LUO changes are landed. VFIO liveupdate series
> will go through more iterations, so we will have opportunity to make the
> change. WDYT?

Sounds good. I am not 100% convinced yet we should switch to a
retrieve-into approach. But let's keep discussing it VFIO and IOMMUFD.
