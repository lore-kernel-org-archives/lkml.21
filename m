Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133978;
	b=omnBE1wtX+JQH8TIDZkxkeuJr5A4gam+yn53jbVoTUQ++zaKEb407pIIsCYl1W1zS80c
	 AUQLcOk1WVPHLZgMjsrV1rIhZW4ZiK78nyHnSc73z9ujGDNR8bUkrIQvyYtSy0fZAzUVJ
	 27H83pKlxFeVOSco+nmDtY4Q6CMb+kUMFAF726LXV76LQHB/z8qQCDd85ko3HqJXzp/vn
	 jcCWWrZIrmdWsJfctFt09wy7RFnFIdDLnMsAu6rPWovwpTNUUmSIEz80ZFb1RbWPFBe1c
	 TpmN/BEZEDJTBuSyJ1MEdaDK4uVxjPdR9EYloaxBAlF8MUfYr9s/RYxVBrbfwMW0ZmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=n7l+AyO/cRMVQJwJa64VigJKwgCGiEZe5FhWi4AHvFM=;
	b=cmVUeQroziIggMMzUS9G1hUdExZSmWkrauChOJZuF08IZB4VftFsZbFapxRr9Ij85FGJ
	 7kxMaBg4ZdH8FtQe4UT5GdcUDD4F5aBJwM/Tuw4f36+jfMPJ4dXZazPS8nZeii3PU3ckN
	 B2N7UaSVl/Bq+vQBx8TnzWoIANYNo2am97Ty0hS2fy06RzRxxSv/qh7XoQjILcSJRRFyB
	 VgHqI0XSRYfpAZKYgcSJlzyP+n7lkLufwUqC3XkrEao0S63sE86vy1ds/GBbwVBOGvFVS
	 8Pb2Qws9YK4dNlPPtSRCasR9gxYLNjr4ZRnDO6annEUPgyPu+K58p7CIBz7RwqD9JcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PdhTt60H;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC9606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40FC9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PdhTt60H
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f041f88577so1991595ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795133977; x=1795738777; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n7l+AyO/cRMVQJwJa64VigJKwgCGiEZe5FhWi4AHvFM=;
        b=PdhTt60HfDdlbgtnPHfsSmeHBydQzoPU7kBA2tY0Ozd78IUkx0lFNNH2yQEnk+t921
         4E9Tm4vx1WTnyn6wVtiNLws9au3Om8UjAH+aHWnF9UWUCSm6dRehNZtZrRMRyiJKAdfQ
         YnTwSvF8Sds1TTxbi5V/mZOO0ENi8tkjlt9pqsZCHwuUE36BF1CfNzDd6CjA1gvbCV0K
         t8tBNb4lXwSyQhCSx3AtuTpJROIDOnqKE7PXyQm+EW6Ikp8UHZwMZtLLhZ8OhuurDTSV
         31cPFPu1KFP9meTVUMuhIsGXcN1R94M301aF17ZwKIG89GFOnVfy1AAlTXsPDOoCWZDL
         cbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795133977; x=1795738777;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7l+AyO/cRMVQJwJa64VigJKwgCGiEZe5FhWi4AHvFM=;
        b=LI88QNT0BxtgEjvxjvpxmFLeBRqIp9i/ct59dNMpahFCG3Ug++6Gpp41s6niGrNU/s
         7U0RS8EHvuMGNG6UaRhePnxpDNP4Rc+QmDiXlw891ggcTs1RiVrvyL7ViQH1oIRg6mKu
         vLb9gcy52K2x4AD7CftwXgG9SVu2/hCfvgNhCHHBDlpsbQhw6tjXOMiPhZ4GR0/kXecV
         /FdBibW/Nypl+B7VLiI7W+PzKgtg4OgbnLcW/nPvSpCWRAdVgsCPMUphN1swAEK3r0Wx
         m3erfTYfL3ylri73x2yZB5CBy1pK318m0hvdsQYTfTSxJ4jHgdeiKV2WXMA8tEXh+DA2
         YJwQ==
X-Forwarded-Encrypted: i=1; AL+hErFqJgdCGKvtsYuIRWFkN+vbFuzA3GHDkDbwhsyeeVbHIUcGC96kMMDhDiLZqUDFEHh/l/6Gdq+vVdlnD5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DgA1jOoBk+ZhaDrbf52EX49n2q9cTNfEorwNoN/qVHt/1Rj8a
	/ZmErNWl/MF9T3FDi5zKYrfnk0uRQJ1/uMLve7K7vRaXTg2JjaaiOSghEJbWtj5ccw==
X-Gm-Gg: AZFdTZc2mYRXJqZ8wLlqQtZ8PnH+oWGtgDBT2bRihTIWjhniZeSrPSEyyDSELyjNY9G
	8u46sWcOIs38f3GuUqfar4RMgqu08gjfZI5Nq2VTPV8EUY+VNvE5mErFpPaemo06M5ByX746nLQ
	nMwG6KVfbx/x3ycktGpXAdHG2x/lczEwTx79gv07S3P6YqxJTIIL8WsrH4qZ2tPlNh3Z4Iyv9FP
	MIRvrj4WHVRCBn0sjHhQkZDvNZZaVeSiF42kMu4RdCe7/tTahSGg775WWJcml1X0sexIR1Gzw2p
	gaQsPNWcmMNfyN62wbxndGJo0BlSVTapZZsn67STl2vC7sgqQ/4i4XyLPXqsGXeVQdll7UNDRHl
	vQNwRSET/lFgI91YXQvRDOzUpL+Be3bFm570WBVSgnFLKFd8J0soiGDl56mLdQr/PQ6nctQuPn4
	0cFFZZs3uyhITzbKuAs6K/ZdYOoTxWRcR5uJqoNvsu0ZJQVNOLZr6BD7VomvppVB24vDcQ0fsAO
	+f9VbJNmbjhhSsBe//igVIvSyGAkkT38wFrMPrMimVmvm1MkmBRA9F+op4QKL0W8GLUetr4TfHl
	E4TwSSG+p5SNYDF1sHiAV2vgLq/9to8XpT0/lT4IDWFux+MhuRvoZsQJAhMq3tpF
X-Received: by 2002:a17:902:e542:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2f03f1a4967mr13941365ad.30.1795133975980;
        Thu, 19 Nov 2026 16:19:35 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0ddf40sm5969655ad.37.2026.11.19.16.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 16:19:35 -0800 (PST)
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
Date: Thu, 19 Nov 2026 16:19:34 -0800
Message-Id: <DMZLVV5YW6GW.1HMW8L8NIQ1XR@google.com>
Cc: <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <dmatlack@google.com>, <graf@amazon.com>, <jacob.pan@linux.microsoft.com>,
 <jgg@nvidia.com>, <jgg@ziepe.ca>, <jrhilke@google.com>,
 <julianr@linux.ibm.com>, <kees@kernel.org>, <kevin.tian@intel.com>,
 <leon@kernel.org>, <leonro@nvidia.com>, <lukas@wunner.de>,
 <mattev@meta.com>, <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 12/27] vfio: Enforce preserved devices are retrieved
 via LIVEUPDATE_SESSION_RETRIEVE_FD
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, <kexec@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-13-vipinsh@google.com>
In-Reply-To: <20261102153656.1431701-13-vipinsh@google.com>

On Mon Nov 2, 2026 at 7:36 AM PST, Vipin Sharma wrote:
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index 12557d45dfee..e6ca4c3fda06 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -11,6 +11,7 @@
>  #include <linux/cdev.h>
>  #include <linux/module.h>
>  #include <linux/vfio.h>
> +#include <linux/pci.h>
> =20
>  struct iommufd_ctx;
>  struct iommu_group;
> @@ -446,4 +447,21 @@ static inline void vfio_device_debugfs_init(struct v=
fio_device *vdev) { }
>  static inline void vfio_device_debugfs_exit(struct vfio_device *vdev) { =
}
>  #endif /* CONFIG_VFIO_DEBUGFS */
> =20
> +#ifdef CONFIG_VFIO_PCI_LIVEUPDATE
> +static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_dev=
ice *device)
> +{
> +	struct device *d =3D device->dev;
> +
> +	if (dev_is_pci(d))
> +		return pci_liveupdate_is_incoming(to_pci_dev(d));
> +
> +	return false;
> +}
> +#else
> +static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_dev=
ice *device)
> +{
> +	return false;
> +}
> +#endif /* CONFIG_VFIO_PCI_LIVEUPDATE */

No need for the ifdef here and 2 definitions here. If
CONFIG_PCI_LIVEUPDATE is not enabled then the compiler should be able to
optimize vfio_liveupdate_incoming_is_preserved() to false.
