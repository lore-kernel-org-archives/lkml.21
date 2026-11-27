Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773491;
	b=tip6hKKTRfwfOxX8Yd6asrX1b8wKO9twp8XteOrsTQto5bpWiBNbQZmduzoJkERUbNCi
	 tmtBE+939V4QiTHlInq9U6TcNQIcNfRtT+U6JfYaKLkVx5/zpceUgternnjGZ8UJGSIQS
	 j3XGPNRREbGZA+8EMxsuvsKjH/dMuUduhsZ+j5Tmov0xH8unZMAKgmUlZzzy/MEVbMMAn
	 5ZkY8/DL4ir9bqWFqf9X7MICyOlkA8eV5nR0jnRadhctvNZZR8B0nanz5ZMCLsQPVIqBZ
	 pe8d/3FHTfj+XEyT00Vl9bg5Pe2rw9fkFrQ+BoWmklnreAG/SGg+NCK01GqREfp4Yxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773491;
	h=DMARC-Filter:DKIM-Signature:Content-Transfer-Encoding:
	 X-Original-From:Content-Type:Cc:Mime-Version:Received:X-Mailer:To:
	 From:Subject:Date:Message-Id:X-Lms-Return-Path;
	bh=r97hwU4N17SfwVsqc3YaeybiabS3NKCnaokufXXj/3U=;
	b=gAz631dRAbctyKtKjrTirMGYfJsm3dBEr5wYupjVG0LasFjdW7jcjVqSsyM/UEjMPdt/
	 CU+DpOaRolQbaEej5TkJtQZ9WYOmFuigCY8KT+DYQ6KMSN4kYeafnb805EeFg/Le/4SbG
	 sTg8ZnOWzLIzkJmLrf6lP7iJiV964nMXJccz9VnoJkqRC+9LOArhj4hV+kv43hCc+b3bg
	 6wEOMBRINbCHTOs8PWZh5gr+FFkOYnUJhhvdzg00myttpWM98PrcFI6SiL87IiKYzf9LH
	 m8JwLLJvOM+nrDRgFHFOnwTAFLlWVnkBL99ujTgxRohD2yzw+kgXYjdN0xB5NgcKKKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fygo.io;
	spf=pass smtp.mailfrom=fygo.io;
	dkim=pass header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=deLjRqlM;
	arc=none smtp.remote-ip=209.127.231.54
Received: from va-2-54.ptr.blmpb.com (va-2-54.ptr.blmpb.com [209.127.231.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A924606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A924606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=deLjRqlM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1795773485;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=r97hwU4N17SfwVsqc3YaeybiabS3NKCnaokufXXj/3U=;
 b=deLjRqlMeFXGfaTCUmTB/SS8Vchcdk7FnkZ8FSOaPyfZuvyZpKqxrJDcTI5WWIfcomBrLH
 tBvnYp3X/LC2ei/RXfb4oCZUPk5wl3yMNqVSAYUhi17Q83/8uX/trL0pSyMOshZ7TBmjQR
 tnw3PHwxhqc2YwofV4+GyKhfQZ9kdOIIjNQ/jZqqw9IBODefFZazLcT7npBGqGFo+fDOjO
 IhqJcetpVrl16B5K2gL9fYK/OHwdSjFGc6jgYdRF7Zue9y88QzFJoLoEDm2sB0p+BI2VUm
 XpCr0eUniwRAHAHqCiYrWGArOqjLKzMWvbGSbA9FRCBoSS4qyUoADL7aAE7pAw==
Content-Transfer-Encoding: 7bit
X-Original-From: Ni Xiao <nixiao@fygo.io>
Content-Type: text/plain; charset=UTF-8
Cc: <linux-raid@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<song@kernel.org>, <pmenzel@molgen.mpg.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from localhost.localdomain ([183.34.163.136]) by smtp.larksuite.com with ESMTPS; Fri, 27 Nov 2026 09:58:03 +0000
X-Mailer: git-send-email 2.50.1
To: <yukuai@fygo.io>
From: "Ni Xiao" <nixiao@fygo.io>
Subject: [PATCH v2 1/1] MAINTAINERS: Update Ni Xiao's email address
Date: Fri, 27 Nov 2026 17:57:50 +0800
Message-Id: <20261127095801.79633-1-nixiao@fygo.io>
X-Lms-Return-Path: <lba+26b09542c+89e27a+vger.kernel.org+nixiao@fygo.io>

Use the new email address.

Signed-off-by: Ni Xiao <nixiao@fygo.io>
Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
v2: change title name
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c72a281a8167..6bbee57334b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26061,7 +26061,7 @@ SOFTWARE RAID (Multiple Disks) SUPPORT
 M:	Song Liu <song@kernel.org>
 M:	Yu Kuai <yukuai@fygo.io>
 R:	Li Nan <magiclinan@didiglobal.com>
-R:	Xiao Ni <xiao@kernel.org>
+R:	Ni Xiao <nixiao@fygo.io>
 L:	linux-raid@vger.kernel.org
 S:	Supported
 Q:	https://patchwork.kernel.org/project/linux-raid/list/
-- 
2.50.1 (Apple Git-155)
