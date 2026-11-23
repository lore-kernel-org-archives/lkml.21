Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795402884;
	b=pz8jEtgEPfD0Lrvx8zVs/wbEAUoztLc7zgII/ujVOaLwTTzLApHya41bMjEhG5DAY9f2
	 ufr4zcmt6p/454GUA+ml8vrIA/b73qzZC3Nev0w/1eA0xra58gQ97xK2sFwBq4L0wQSaD
	 sLPeaRkf03XFU5pF63/x+Ai1fgbNJuJ4XXSdFJyo7DfDZ/RsWoUE4C3ehTsoaZWfOqzpe
	 FxzOdTScPyCW+4r7t52NoCqKGZRNaC3EGAtF/SffkNWMEnMRbFSwwv2xPt0hkemdm7+JN
	 S4i1OTC25S34eJts6HWTe8tqosW1GsnPjqZnD3DjJt97aVTdyR+0rkgy4/U0IDO4+eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795402884;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D8O+YZ7geHUioOfRz7r3O1SenNYmei/5V7Pdoaj2fz8=;
	b=T8gtzC/X1UAbjjz0E6YtfzauurziG8UP9tM/pBitVNfPHYjPtNmt4kP46Qks0ekY0yx8
	 onkKB+fp9WaemuXAVWnqifosQAni6jOcaEK2YRMsnvSSqHvSfELuEqcqEFoKpNO0lv+hM
	 Zczvsgo76g6zDcvBIGcKPSS193XnhH7tjqDk0XMnO4t3C3x0SPvDZT54T2f7DE0STq4sJ
	 tptPMWy5ii/+E87WG2hjNZSQ+UIXX2BTebXud+LzTHi/r1p5qZH4JmQUVMK/X07+cJWyY
	 4VCgNWYv56PeA1wGF/IVa9hF2gf334zBazBZeF/VioMOirAtm3E6Poohakd6WyhO0zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=mMDFJLoa;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD96606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DD96606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=mMDFJLoa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=mMDFJLoaoyT25HS7Qk1IKlsW/D4xB1plgL8OhDwWu8WpyBf5coGOyOLSbFRZxdygn+IA/+tubnrc5
	 6uaN6T+lFsBbyCeDBM0LtjMqtdsUT9PyDEBqOx2F5T/hIzo7e27CNMAYXU7Ihq+L/xlKPVmNhjZ4mm
	 R1tylPk3KwlfC6zM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76b03ac7ffb5-39116;
	Mon, 23 Nov 2026 11:01:20 +0800 (CST)
X-RM-TRANSID:2ee76b03ac7ffb5-39116
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b03ac7e1c3-ec53c;
	Mon, 23 Nov 2026 11:01:20 +0800 (CST)
X-RM-TRANSID:2ee86b03ac7e1c3-ec53c
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: tzungbi@kernel.org
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	bleung@chromium.org,
	lee@kernel.org,
	groeck@chromium.org,
	jthies@google.com,
	chrome-platform@lists.linux.dev,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: cros_ec: Drop OF node reference in ec_device_probe()
Date: Mon, 23 Nov 2026 11:01:20 +0800
Message-ID: <20261123030120.1799-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <awOfCgL-eriqrws7@google.com>
References: <awOfCgL-eriqrws7@google.com>
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

Hi Tzung-Bi,

Thanks for the review of "[PATCH v2] mfd: cros_ec: Drop OF node
reference in ec_device_probe()"
(https://lore.kernel.org/all/20261118062949.1250-1-laixiangwu@cmss.chinamobile.com/).

Both comments are addressed in v3
(https://lore.kernel.org/all/20261123025022.1761-1-laixiangwu@cmss.chinamobile.com/):

> __free() is defined in <linux/cleanup.h>.  Please include it in the file.
>
> Alternatively, simply calling `of_node_put()` after using `np` also works.

v3 adds the missing #include <linux/cleanup.h>.  I kept the
__free(device_node) approach since it avoids explicit cleanup on every
exit path of the block.

> CHECK: Alignment should match open parenthesis
> #61: FILE: drivers/mfd/cros_ec_dev.c:280:
> +                       retval = mfd_add_hotplug_devices(ec->dev,
> +                                                         cros_ec_ucsi_cells,
> +                                                         ARRAY_SIZE(cros_ec_ucsi_cells));

Fixed in v3: the continuation lines were indented one column too far;
they now line up with the first argument of the call.

Best regards,
Xiangwu Lai


