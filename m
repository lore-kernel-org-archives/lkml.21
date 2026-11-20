Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142813;
	b=Im0qrEg7j1WVjg85/e7pU+3oqzZ/YOU3C2/cwFrUa1y4nwuhLdGzZNwQxYD52aif52k0
	 ajKMF3TLmxkOjk5BZyx42fq4nywxYDh8thTKIuoad3XPXBaSezSkeRxEaIytB3DGJiN4K
	 4HqbTs0NkFTwXXqTfMklOsZ3KjgjzhS46D1qD/dn5eOrfH2eD0GabtJXyJSR5ytfe/4JX
	 jznXP9qwUCFA5q3VYAL1UzUqFLmKdJxp+c8ucmpQ4GKjJEjwZLIjXtdsjXt96x6UYLZ8i
	 sdOXTm2SgDcv9ahCJYdyLxPaD/WtwHIiN1+iHwOLk71SENMZiTh36hLwZbZonypJ3mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142813;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ZFuIn7eF+7IrMuyJSWuYqvoJgRL9RzuWtqR/N7Allwo=;
	b=uBGWz/Bk4YWVbn5aOt1Mv0br/FM99tAm2nDCvX7sMLqOXlHClE/X4oCz/z98Une5IkzJ
	 ttKSuFD0irUZ+LJjulmyHyxi9uTNYm9FolUMZEeDaa/lhsvccTkD/sNFdr6H7ov3sOLU+
	 j9SyYlhGStjVNVrh7zV3wc3GEYjHkqZTCHrJWV8Mub8RP6H0cNf6XAq/ShNR7mrCubJ5m
	 poMw8I4ektnRm6SW8XTDamxtcDT4YKR3rorR31Tp43nrkPMy357wpci4pGQsM0lYlbxK5
	 2tTcCjBiLZziF5ia/fYwW4zOpSSDJuw6zTyzOgcc7o1CH9IeayyRnO7jySF+ZQW5vBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DEC606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29DEC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=ZFuIn7eF+7IrMuyJSWuYqvoJgRL9RzuWtq
	R/N7Allwo=; b=rx07YghE7p9a9fDk4Y64F0VlQoYnhjtoj5nyPztn/v6acQPWXM
	eh/7nWwHrKlmXBdOMQAWDjnCkZpyf91N8GVb/J0VI4b7aZ/D0iBiYX+EciWGupyL
	8ifsxErBYQRC1WXXBJPlUODT3eWA+8RJfLbp58rvWZQWkF2IEq9u6ukkc=
Received: from LAPTOP-FRMFRHCN.localdomain (unknown [2408:8670:ae1:0:bbb2:6215:5dc7:c1f8])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkCmrgGItP9qCYbrAQ--.30261S2;
	Fri, 20 Nov 2026 10:46:32 +0800 (CST)
From: Haoli Zhang <26031212468@stu.xidian.edu.cn>
To: frederic@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Haoli Zhang <26031212468@stu.xidian.edu.cn>
Subject: Re: [PATCH] posix-clock: initialize cdev state before publishing
Date: Fri, 20 Nov 2026 10:46:29 +0800
Message-Id: <20261120024629.1145047-1-26031212468@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <av8j0vUFpUg2aZyf@localhost.localdomain>
References: <20261116032853.825-1-26031212468@stu.xidian.edu.cn> <av8j0vUFpUg2aZyf@localhost.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:BbQMCkCmrgGItP9qCYbrAQ--.30261S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYs7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvE
	ncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I
	8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I2
	1c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVA20wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUj5ku3UUUUU==
X-CM-SenderInfo: yswqjiasrskluy6v33wo0lvxldqovvfxof0/1tbiAQUDEWr-ENiBogAAso

Hi Frederic,=0D
=0D
Yes. cdev_device_add() calls cdev_add() before device_add(). By =E2=80=9Cex=
pose=0D
the cdev=E2=80=9D, I mean that the cdev is registered in cdev_map and its f=
ile=0D
operations may be invoked before device_add() starts. I do not mean=0D
that device_add() has already registered the struct device or created=0D
a devtmpfs node.=0D
=0D
The cdev_device_add() documentation requires callers to assume that=0D
userspace may open the cdev and call its file operations even if the=0D
helper later fails.=0D
=0D
Thanks,=0D
Haoli=

