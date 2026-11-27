Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779130;
	b=XBV/D1OqeJhBYxunw4gKlCD5cMmkrZ2KDNs85YaK25eyM+O4KcBVBrAumNZj7ljiNljM
	 Q/ifolAOOX/qwEWNfDv8a696OUGujUc5qcM4gfpTEoYYDRTdYSjyiQOxgidZuVnCib1ii
	 Zk8HiWDI5LMTGuBzl4wurZnb7LJSinskYP4pT8DNa4iaoYi+eY9t6aJQC3zd2j4vOhY7f
	 iMCYVnhHKChX2WoyAq9ACC4IvBhvOOz9rdBCXLx8GAczUKopewVOJ1yUCXKFDYJ/e8Tg4
	 JFj0ThrAcgZ/akSvU5+J2v54Qp10oglvjXd8g91fmg1YC8vJwwGBscwdqVyHOzsOp+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779130;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=s9yp4SBxO/oHO8LIQtXVK8tFMz7ppzjwdoJtbh3yIDI=;
	b=eCgXvDnVcLQM88b2k78iR2FyKgJJHC3zJTBxPBU8T/n9bX2+jzdVU5dvMrAHBZIaaW0s
	 i9gEaqVEzAjdFkr3YsH519Kr5ZOl8RwIKakJ3mU9Gsra7K9mb9qaIk6ix1uoI2VZfiJ8m
	 aA0JIAdIv9HGkHzqSrFIb3xkfI6MEnVEdYkAMN2M47y+wTbBU705aQKAhfX8qemiGa4HJ
	 PWQOKxbNf0Wd5wvrb3wv18oRhhgaONNCEPGRlupEYPnz2FUfPOdroiHrkk1UFHZHmBO+d
	 PVxrLhyrh8OODDpOvmZ6DpY1z6aPif0/V7ng3uHSTpmRpt0jumx/4qn/cg41D2VNtRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=KqYjVDkN;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C40B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C40B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=KqYjVDkN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=s9yp4SBxO/
	oHO8LIQtXVK8tFMz7ppzjwdoJtbh3yIDI=; b=KqYjVDkN4u/lA5PmgbjVWBJZRL
	MBZA+NugTE24LHVqbvSSspMInLleVwlNkzCfKsoC/nHvaHEj3DOiSHWBaymzq3oT
	e2wmZPXyHV//yZEBcewcrGfSadgKbSSy2UnSEXD7nR3g+Jr/mzl9YhxMBn2l86kS
	tJlaqVAe7z3A+jjgg=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAntEgZaglrkHICAQ--.2585S2;
	Fri, 27 Nov 2026 19:31:37 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] coresight: add missing MODULE_DEVICE_TABLE() for CTCU and TPDA
Date: Fri, 27 Nov 2026 19:31:35 +0800
Message-ID: <20261127113137.931578-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAntEgZaglrkHICAQ--.2585S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1Uuw17Jw15uFWkKF45ZFb_yoW8Ar1UpF
	W5K3y5Crs8GFsYvan7AF1qq3yFyw4kKr4YqFn5J3y7u3Z0vr95ZF1jka1rG3ZrGr15K34S
	kan0qryvqFyDAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jYlksUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggAMs5

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

Qianhui Xu (2):
  coresight: ctcu: add missing MODULE_DEVICE_TABLE()
  coresight: tpda: add missing MODULE_DEVICE_TABLE()

 drivers/hwtracing/coresight/coresight-ctcu-core.c | 1 +
 drivers/hwtracing/coresight/coresight-tpda.c      | 1 +
 2 files changed, 2 insertions(+)

-- 
2.51.0

