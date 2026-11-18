Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983428;
	b=uPDC8VnoNYdGvmCHvPwQ2ltck1FzBN2g76RK7+L5ryHmlw0FnvkavQuFU0xrhD6AmtEy
	 luz1eze2PfJgwq09T6wGombKnsOkfUm2mltfM7thc55+mo/5Dnar3Y4kLH2qP4TJ19Rw5
	 XBkoFjF4Jli2w0pQ40rmO9UMCUDX5OyJP0Lwwk+wVD1QZ/NlN5VorbpRrz4nEJk6unhCR
	 acD+T1GjvjzHbDegzpYU47BfDnpGNvkC0fE2zcOv+l7zAYY0gR14YUFSO5yzxcsjglesp
	 cBGgyG0hYReok78KWy+6O0yMVJbnoJVwIYpAW3u/VBSCo4LuXIFDAz9G3VNBpXesuww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983428;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FkwpcJ9P5gfK4/EiFWTNomZOIkrMoDrhvqK6V1J/veQ=;
	b=axgfvz0E60rAnDzXaZQ7XlOvF5GS/XBX7zXaeYTERGphXAZ7+jm54BJLdz88Rlpt7L0U
	 i9+XpAXvAe5Tu7MvY4N1WBkZpue1ZLuiWtwukzMblR6isDiT2So/CA9f6NcsBkUvE0Keg
	 IKg1BP7x3PBh9DysGgucbMTPQX+OD1gW22aYZTE2Bx7H/lG1nqwML2/Zd53MoY8tYJM+s
	 4VO/edpbxFIIvXDEIOUQj7cLFm1dr4ZSGeSItT360nRHmBol8NZrLUDrUXEfr4UaRA2Vf
	 huI7DHVPoJOJr1hiqH7S6SaoyuXrriLEOvzxPGPzogLsSoBHw2JvnHQJ7sJfVFXq/cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=aLJ3y8wR;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42899606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42899606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=aLJ3y8wR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=aLJ3y8wR+0x5/NOCKPz7MR9gtxyGrXRJiG5k9fp1QkdZH/BjD9fBmZMTOlRiCXIkhMyzr6v8eEf+A
	 1cuB0uHhGs+w87dt+zuReDb7arX6ddod6vGmOoPxFjbDQodoJrPu4AqLs5cBLD+e0o95UtBVAtllkB
	 4td16ONCXo+72XJ4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56afd4601247-0dd54;
	Wed, 18 Nov 2026 14:30:25 +0800 (CST)
X-RM-TRANSID:2ee56afd4601247-0dd54
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16afd4600c3a-cc2e3;
	Wed, 18 Nov 2026 14:30:25 +0800 (CST)
X-RM-TRANSID:2ee16afd4600c3a-cc2e3
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: bleung@chromium.org
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	lee@kernel.org,
	tzungbi@kernel.org,
	groeck@chromium.org,
	jthies@google.com,
	chrome-platform@lists.linux.dev,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: cros_ec: Drop OF node reference in ec_device_probe()
Date: Wed, 18 Nov 2026 14:30:23 +0800
Message-ID: <20261118063023.723-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <av0gBCp63QZ2F8gy@google.com>
References: <av0gBCp63QZ2F8gy@google.com>
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

Hi Benson,

Thanks a lot for the review! You are right on all three points:

- moving the of_find_compatible_node() call out of the condition broke
  the short-circuit evaluation and made every probe (including the
  secondary MCUs) walk the whole device tree for "google,cros-ec-ucsi";
- testing !np after of_node_put() evaluated the pointer after its
  reference had already been dropped;
- and the extra declaration was redundant, given the existing
  "struct device_node *node" in ec_device_probe().

I have sent v2 scoping the lookup to the UCSI block with
__free(device_node) exactly as you suggested, which keeps the
short-circuit evaluation and releases the reference automatically:

  [PATCH v2] mfd: cros_ec: Drop OF node reference in ec_device_probe()
  https://lore.kernel.org/r/20261118062949.1250-1-laixiangwu@cmss.chinamobile.com

Best regards,
Xiangwu Lai


