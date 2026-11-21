Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233538;
	b=Konk6adoC4DLY3rB8qgChJ7TlaTuNZosxaWExbSBmjjwWhSwf40NRdRVsvGqL7e4IgrV
	 PuaOQZexkhBcUHghlEPKrIp55psSwc8APiN5b01NwmuBqGW9I78vDv+W8in365Rk81PA5
	 MC7nsCTfv/KXuwuYS434xeS5upiLdTJCVWWfZxZFGegomBmV1YTvDEz45LDbM5cWDxZeh
	 FATlguNFSdJK8/fvuUGs1EwNEi4gwk5qEfMBZpHePPVSByWqvhtTbw6gwDBkybvvGyHyo
	 eDqPEyGuViU7wG1I8D9e+3IeAMGx9ERgC6axA8oDzHPRGroQoGRWys+ydbmjH9z0YTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233538;
	h=DMARC-Filter:DKIM-Signature:User-Agent:X-Lms-Return-Path:
	 Content-Transfer-Encoding:Content-Type:To:Cc:From:Message-Id:Reply-To:
	 Mime-Version:Received:Subject:Date:In-Reply-To:X-Original-From:
	 References;
	bh=yofjDEr5Dkjx7MQ31wnuFXB7HN/7rlhAChlwZ6N1djs=;
	b=LV9RzpfpbEWtcrBuCnjeoQutTud7s4m/I0VBNkJSSP7T3iTjZCSwTMrnB7wt17Mz7BHj
	 RDjEwb5/VifLEy9IPcbLfpbKSgB8Il6+9n3ViWoXxMQCHyu8ar9LFYNixblJw7KigxWvJ
	 Io1f1W5S0T/NtE5Phgo1VsZTzSvMPfrUR6cCUAp86Ool2vKRAfpp2EMU37pR2zUxyzzvG
	 iNjts7C0T3XEkzclxWfrH4DkCBz6V/pGThaPcMZKc6EVc9OsIjH2tUTQOQIpb6XGOci36
	 A7bgxVupt/tbjO/Q2qVQXB8uR5slN0uQ4PUbwm61SPO0FCAzDbhiL3NGSzwvI3tpIbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fygo.io;
	spf=pass smtp.mailfrom=fygo.io;
	dkim=pass header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=mv60N1Et;
	arc=none smtp.remote-ip=209.127.231.53
Received: from va-2-53.ptr.blmpb.com (va-2-53.ptr.blmpb.com [209.127.231.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0737B606A68D
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0737B606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=mv60N1Et
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1795233531;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=yofjDEr5Dkjx7MQ31wnuFXB7HN/7rlhAChlwZ6N1djs=;
 b=mv60N1Etgqs/cgZtT8zLiR2Mg0btZc/tXIsW5oSRnndppGHGU/E5twckMyiMrH1OB3BDgz
 5CSDp4nmMStajGLeaHrXSXMv23+cUudQOYU/HqD02IGrQrN8ql7dmkLbSCE/Z3tbkmTnW8
 uriEyqkf74OWYZbEns3H9fm0l3mPeGkWz9YGf+gbm07ULEa/oVFbLiAKYDICJfVHzgCXCb
 zfhVbnfdMylZ97OTL/d7BfrkRjlnPoIM9cJKzTbvVn2XiTa2IDQ7rgJoiKt4Czu5ycOhLI
 /rRJUL6piOSJ0cbg/uH05HNR6jbV3q01MNR0rMD1NFoWXWo1UDLILYx/LfWOQw==
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26b0116fb+9aaf18+vger.kernel.org+yukuai@fygo.io>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
To: <shao.mingyin@zte.com.cn>, <song@kernel.org>, 
	<linux-raid@vger.kernel.org>, "yu kuai" <yukuai@fygo.io>
Cc: <magiclinan@didiglobal.com>, <xiao@kernel.org>, 
	<linux-kernel@vger.kernel.org>
From: "yu kuai" <yukuai@fygo.io>
Message-Id: <8fd7fbd6-8948-4e6c-84a2-2dfc378f18cc@fygo.io>
Reply-To: yukuai@fygo.io
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from [192.168.1.104] ([39.182.0.159]) by smtp.larksuite.com with ESMTPS; Sat, 21 Nov 2026 03:58:50 +0000
Subject: Re: [PATCH] md/raid1: drop the redundant sysfs_unlink_rdev()
Date: Sat, 21 Nov 2026 11:58:46 +0800
In-Reply-To: <20261101200958563ZkI79UKy510arbmzZJPzd@zte.com.cn>
X-Original-From: yu kuai <yukuai@fygo.io>
References: <20261101200958563ZkI79UKy510arbmzZJPzd@zte.com.cn>

Hi,

=E5=9C=A8 2026/11/1 20:09, shao.mingyin@zte.com.cn =E5=86=99=E9=81=93:
> raid1_reshape() unlinks the old "rd{d}" link, assigns the new
> raid_disk, then unlinks again.  The second call targets "rd{d2}", a slot
> that has no sysfs link yet, so it is a no-op; sysfs_link_rdev() below
> creates it.
>
> Signed-off-by: Shao Mingyin<shao.mingyin@zte.com.cn>
Applied, btw, patch format is a bit strange.

--=20
Thanks,
Kuai
