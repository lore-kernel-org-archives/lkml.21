Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786276;
	b=gQS69zS/thgug6i2C9ueFXVv2eq34W/aXxJd3ID8F/YAPsI4pHjKzBEcFKmy6W6zS7Yg
	 bxtDN1ET/eeDqIe/v4guX675JRT2iVMlYGgzDXZsH0iba3/WPrcFFWR4UTlsfVoR2+L4K
	 Mzbx1Baa1RbXicphltMHtqhzCRO0/F3S70EJMrK5xeX9Rq1QE+EAdI+dn+6n0jR+ip/TP
	 WvLWMGtOdvEAi4x5MS90nOPwFpaFEsM+7hxdKnRlgtsXjiZwBADUXVUDFIvPDmJf91D+X
	 dVOVp3sgjurpe7ySpDarVSqJZzwYpEZaNr5g6dxT1fK/gY5qvRqFAv2xuj5VXOiTYWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786276;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=j+AhWvZjNA/Qk9G+7JEfWEukJQ9zCiGKSKZhtBAXKPQ=;
	b=JHnMg+YZ8GugxP0O7cHeFSZzWD0kr8orVIHN64B62BRLuyA/0pC923hk7sUcdQqSwH4v
	 EItxIqSzWnb6m12t8rN0fK3CaiVh7HyplDnK5L/KaA4we6qopMkwgRJeAZdkJJjusbHXY
	 89TBVSb16k5k7A+iABGZxA4SkeOrcq0CQyVeefcjraty5KPN7bfZs5tRTUujA3l+MABH/
	 Dn4SFLKz9+V4IY4hW+HG3J0IO2/1aVOlRkGeZXd/hNZLTArfVBAnC5sAAjDOmtj/m/F21
	 3kB0gemozZg7ttPelQtSXy/x6GL7m7V7WFtr9HRqPb8yct+BwOAbjTB8YZkzrt7hfNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=M6xj2LVW;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB09606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB09606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=M6xj2LVW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=j+AhWvZjNA
	/Qk9G+7JEfWEukJQ9zCiGKSKZhtBAXKPQ=; b=M6xj2LVWlIjUY6pgxfYIdCd+05
	VXuIMTGNTYuJESK7oU8x+51SiRaNjnXJUrrbbGQ3DYkxfqqKPpDqDd9eLY6mOhci
	LO365OnfaJYB0u7qqBDgt4Ay1+8EBt2Fx5E4qpVHMDciZNlTNvaHGKknbVRY4tcw
	1V1Spp3geeQ4QnZPM=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCXI0jphQlr2eQCAQ--.2853S2;
	Fri, 27 Nov 2026 21:30:18 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] coresight: add missing MODULE_DEVICE_TABLE() for CTCU and TPDA
Date: Fri, 27 Nov 2026 21:30:15 +0800
Message-ID: <20261127133017.1606830-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgCXI0jphQlr2eQCAQ--.2853S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1Uuw17Jw15uFWkKF45ZFb_yoW8ZryxpF
	45K3y5CrZ8GF4F9a1xAF1jg3y8tr4kKw4YqFn8t3y7u3Z0vF95ZF12ka1rG3ZxGr1UG34r
	C390qr1vqFyDAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU838n5UUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggAdso

Hi,

both the CTCU and the TPDA driver are matched through an ID table, but
neither exports that table, so building them as modules produces a
module without an "of:" / "amba:" modalias.  udev cannot autoload such a
module, and the device stays unbound until somebody loads it by hand.

This was found on an SM8750 based phone (mainline v7.3.1,
CONFIG_CORESIGHT_CTCU=m and CONFIG_CORESIGHT_TPDA=m):

  # lsmod | grep -c coresight_ctcu
  0
  # modinfo -F alias coresight-ctcu
  (empty)
  # modprobe coresight-ctcu && readlink -f /sys/bus/platform/devices/10001000.ctcu/driver
  .../drivers/coresight-ctcu

Five tpda devices behave the same way.  With this series applied the
modules carry "of:N*T*Cqcom,sa8775p-ctcu" and "amba:d???F0F??" aliases,
and on the next boot both autoload with no modules-load.d help at all:

  # lsmod | grep -E 'coresight_(ctcu|tpda)'
  coresight_ctcu         16384  0
  coresight_tpda         24576  0
  # for f in /sys/bus/amba/devices/*; do [ -e $f/driver ] || n=$((n+1)); done; echo $n
  0

There is no functional change for built-in builds; MODULE_DEVICE_TABLE()
is only used for module aliases.

*** AI-assistance disclosure ***
This series was prepared with the help of an LLM coding assistant.  The
author reviewed every line, reproduced the before/after behaviour on
hardware and is responsible for the content.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
v2:
 - add the Fixes: tags requested by James Clark (both commits).
 - carry James Clark's Reviewed-by from v1.
 - no code change; the two hunks are byte-identical to v1.

v1: https://lore.kernel.org/all/20261127113137.931578-1-xiaqinghuan@mail.ustc.edu.cn/

Qianhui Xu (2):
  coresight: ctcu: add missing MODULE_DEVICE_TABLE()
  coresight: tpda: add missing MODULE_DEVICE_TABLE()

 drivers/hwtracing/coresight/coresight-ctcu-core.c | 1 +
 drivers/hwtracing/coresight/coresight-tpda.c      | 1 +
 2 files changed, 2 insertions(+)

-- 
2.51.0

