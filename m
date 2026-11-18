Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982751;
	b=z/MyoAzS2O8ItwcEVfD6UayOf6r3L3/dpOTjkFshqCBndDWVZckzGVVwmXiDjYk6a3Vh
	 M0j0qMLlJgYDBBBagIrRn4agFUyaA0OmBvbvSQJI+U05XjFy7ZtS5tEOuypPm/8JY3DBr
	 tu5nBHrLEKeAC4B1wGuF6QGehZrq/BXhedxyX3yoW+tNbkczS+YsqXwn/Qtm8iQLMALgW
	 E1Da4PLHNYDUBng+1DtTsd2UzzgmJCwHxycONL4+hCkUnqVtYIBoKCQaUhQkr0mx04ZWn
	 vCnj6V67wx5Zp8rsV1nRJrvfcvfS4HFNLHjBji3jgcJixrmpctn8b77FkzTDUWNCZxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982751;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:
	 X-Zmail-LocalSMTP:X-Zmail-RealSender:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-ZMAIL-USEORIGINALEMLTOOUTBOUND:Content-Transfer-Encoding:X-MAIL:
	 X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:
	 X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=6gz7Nx7ggXBiPpxUu/CpbITekAUnvYqcbi8BBpYRjls=;
	b=XRPLg75vDTkni+lXG4LRZWTBOWSK8rkub5g6yPwpO/p6HKwO3z/HHryQo0ZXZD/8E51D
	 ryNKUTSpwxXonLRLewE89wiRlQMRAV9gIhUx4DXe0tSYbuPiq2SpSS05sz+SzZ3wLdv5E
	 5lKjXuXzAAE4PgrhyuRqRZr38Gn7w5T3kmcPuE++P39zfX0ZytYThmvK7yUL63mUCKU18
	 W4zcp9OxlU2Kv480rhrOoEjtongda5VsJLQ9SZL7bpsLIYbaWmiZij5LrLNaoa36bkFH2
	 8AVvTjEcAWvIRI4kGJIbf5cPZBVSxyA6Cn4WvIIs23l3gA5fNX8ZcPaQlRFs+NRUtrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sanechips.com.cn;
	spf=pass smtp.mailfrom=sanechips.com.cn;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1352606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1352606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sanechips.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sanechips.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jTryt410jz6G4LK;
	Wed, 18 Nov 2026 14:19:02 +0800 (CST)
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
	by mse-fl1.zte.com.cn with SMTP id 6AI6Ivh0085817;
	Wed, 18 Nov 2026 14:18:57 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Wed, 18 Nov 2026 14:18:59 +0800
X-Zmail-TransId: 3e816afd434602e-b02db
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, andrew.jones@linux.dev, anup@brainfault.org,
        aou@eecs.berkeley.edu, atish.patra@linux.dev, baolu.lu@linux.intel.com,
        gong.shuai@sanechips.com.cn, guoren@kernel.org, iommu@lists.linux.dev,
        jgg@nvidia.com, jgg@ziepe.ca, joerg.roedel@amd.com, joro@8bytes.org,
        jroedel@suse.de, kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
        skhawaja@google.com, tanchi25@mails.ucas.ac.cn,
        tomasz.jeznach@linux.dev, vasant.hegde@amd.com, will@kernel.org,
        zong.li@sifive.com
Subject: Re: [PATCH v7 00/10] iommu/riscv: Add hardware dirty tracking for second-stage domains
Date: Wed, 18 Nov 2026 14:18:47 +0800
Message-ID: <20261118061848.184844-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103120236.53474-1-fangyu.yu@linux.alibaba.com>
References: <20261103120236.53474-1-fangyu.yu@linux.alibaba.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
Content-Transfer-Encoding: 8bit
X-MAIL:mse-fl1.zte.com.cn 6AI6Ivh0085817
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 18 Nov 2026 14:19:02 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFD4356.003/4jTryt410jz6G4LK

Hi Fangyu,

We should add "select IOMMUFD_DRIVER if IOMMUFD" in
drivers/iommu/riscv/Kconfig to enable IOMMU_HWPT_GET_DIRTY_BITMAP,
otherwise it always returns -EOPNOTSUPP. I guess it belongs in the dirty
tracking patch.

Thanks,
Shuai
