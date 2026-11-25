Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795596473;
	b=hUemyYgwnWpXVQEQm36yv3OQlTTExXpqCmNWIjwkSiWWef38U8GgA68JzGaoxCMgBFRE
	 0nq1dc2bVhSXw9JDuItEPvkoOD/xvD7EShuxedniOooSodweYaKvgzxl383AZc+aOeMAe
	 R1fp+cQchr+k9JHPbs6Jb6SUfwuL+D7mYzWuL85f9jN5Bd7eJLvUYSxZB9iRNnV3derGX
	 uAQ1szg3y+HR8eS9t6v9zPuacdPCtNr9vIePJ3N7j/N07moAxJVG+fXg3+pukjr7SDeoa
	 AAUSzaXa87XJwW8ASxTXeT7QlKvRVegWd+iwesEmamF5chHJQGjnZ8gFRFeKGqRB8Dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596473;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Content-Transfer-Encoding:From:Mime-Version:
	 Subject:Date:Message-Id:References:Cc:In-Reply-To:To:X-Mailer;
	bh=y6BbzlK8NdBBNAbrElRiB7RKI8gHjkVAy6G5abVQ5oU=;
	b=sm0rG7ja6q1KwE4CoZpkAyRGi/476soDg65lRNi6o91HcN0JTQE6DiT/JvmgqkzbPerR
	 zQbtsy04cp2lZUQgaF4U5aIaMbuhSgbVMOPvSpf54MpSCcRAlFnUyZfjl4Sffm8fbNe4r
	 y/zsnWFp/y9/3RlHwZOyn2tnQmLR6jzdN+Zvv+E3To5mP9D7vcHGtwmXn6QwZczg/qIzE
	 dRLMHNn2sJg9GHKOF3tzXchLQq3r4cP74Ggd3sDkvEHlYT6nN1f0gmPIsOoy6LdEJX8Jy
	 JVPk/KWLSMmCbz5yrd6AeD15O/rACVaPEISqBs8BM52oiRSJQcZjMp6rNrRKMZM91cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xenosoft.de;
	spf=none smtp.mailfrom=xenosoft.de;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=EJ3ahorb;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=pID2Alma;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.52
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99E4606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B99E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=EJ3ahorb;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=pID2Alma
ARC-Seal: i=1; a=rsa-sha256; t=1795596425; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=m5ssfWSEVIoE+WyH+PakpfTqHJbKYQ2zjX+hI3dokizD7o6Rflok9EWOeYd257wMUe
    JGVOO5UEKi/alZRaL/IH7fdwtK+ki5bovrrRmwmxH7sfp9l4HG0C171C2wLCwvgl6dWF
    5YJPXxJR+x0XFUfVoRqr/sxB1VbNl3tAA4mXaRauHaUImL9/OdfG11Z7shbhdlj9f0NE
    UwHjkJ/1JnYqGKpMmEjI4PNXUkEEJ95EDLkc0dbDlv2O1I6NoMXXvfEdYeG6s2AqtqST
    KNrDhuMBJXlg+vXYqbn5LeuwwMTKvFJMJNQbxbkE7rjIIY9+CubJBNWSSh6hqNJL9pN9
    6GIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795596425;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=y6BbzlK8NdBBNAbrElRiB7RKI8gHjkVAy6G5abVQ5oU=;
    b=TtLPaS+S178OwbAncT0XBYrpgam3UV8QVxH3xyGzXOZAtg2tYEJsAATBt+bEtFjITn
    SYL/oi+qwEL3qdaHR1hfwBmA47nzDe0qTprR7wm7sEeFKpIgOhnDG1A2wrjvWUxdMabU
    JyRI7fXGALlRVT7u2yZHIwD46ZnOVmuNxnMQQ8zdO6xLSk9A6y+42P1Hk3Kfoit/T2jf
    nZpS0Zpo69KraqLFFzBTXimI35fVpuLlY1r8NGt9R6km3qQLMDTjNFVt09VrjLBBjDQn
    lwYmZQ/s4+w0r11TfAIXuTXFmc2tP1E6k49HwZaN5sge1+S1qeV5VUiKcVMs5ZeKE06S
    5Rcw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795596425;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=y6BbzlK8NdBBNAbrElRiB7RKI8gHjkVAy6G5abVQ5oU=;
    b=EJ3ahorbtxLr0BmzAmdeRCcLvK/OObl9suXMA3yDIpya1bkfELnc1KSOCjMe5o+Qqq
    jwGKR0ldyi+X8rh/51Wv8zhFiM1QH0AewO/AykJ4t8t92wLSm3AKLh22tcDxQ1UtMlXh
    aOHuI7xekmzlQhtpsL+5cbdTFHGbV9+OLETxbbcB+GMTGEnnqdpfmCzU/DZM1P4lv3Al
    TJy1SSZKq9Xh3GQ0z1NHElWnZo+DqDumr7SdtyS+IOJs0fLEIs25rhLjU2Cb8/Q1jz26
    ce6PJkS+2oNWYgHsM2kSgkXStdyOQqOfvykxbbJoms4jHy6YIMzydv0X+IEaRGygsme5
    kGXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795596425;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=y6BbzlK8NdBBNAbrElRiB7RKI8gHjkVAy6G5abVQ5oU=;
    b=pID2AlmakioHFpmXvycscfLkLq3XIOg95vLkOoFhrTS81CJCmAzpdyWw8fyn2EytGT
    i3P+XFqkBrIpbpKgA+BA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5mzs3mRC3wE2YFOCcU01WtcQwPmgG2z3vC42vs="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id e825d92AP8l4eQ5
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 25 Nov 2026 09:47:04 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PREEMPT] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted
Date: Wed, 25 Nov 2026 09:46:53 +0100
Message-Id: <EEB13352-2FD9-4169-B709-FF7822AA591F@xenosoft.de>
References: <D0ECD6B8-7F15-48C8-87A4-DFE5F35A42D8@xenosoft.de>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
 Narayana Murty N <nnmlinux@linux.ibm.com>, maddy@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, msuchanek@suse.de,
 harshpb@linux.ibm.com, gautam@linux.ibm.com, amachhiw@linux.ibm.com,
 venkat88@linux.ibm.com, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>,
 Damien Stewart <hypexed@yahoo.com.au>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <D0ECD6B8-7F15-48C8-87A4-DFE5F35A42D8@xenosoft.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
X-Mailer: iPhone Mail (24B156)

On 06 November 2026 at 07:09 am, Shrikanth Hegde wrote:

Hi Christian.

We had one known issue which michal had brought up.
Do you have tracing enabled or running a bpf/bcc program?

- - -

Yes, we have BPF and Tracing activated in the kernel config.

Nemo kernel config: https://github.com/chzigotzky/kernels/blob/main/configs/=
x1000_defconfig

Edit: I have deactivated tracing

Link: https://github.com/chzigotzky/kernels/releases/tag/v7.4.0-rc4-3=

