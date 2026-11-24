Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522239;
	b=2HoJ1Bnd/C//p4tuSjCBqzGKEejK2uIPCanZ581TD6fA+6Gp5NreARlyhNL2RUzpB8Ln
	 PbXE2zur33M6MJ0AEiCC2Zbwam5iV7olKuKPx/eGiCbna3qpsAJFQay6XzrmHzZGqFw6k
	 CCq6lGgbBaS9zqK3LG1yDL4I3BApMZaApssx50dhEVZg47ioXR1GPqUEMnZj80CUOwJ4s
	 MiVgy5jCj3BA/QX9Mimkn5HobKMNToty/nU6aZ6MRr07t876XHTXorbD7nRbDOL0Lzrs1
	 ICLAo7pDoj3urqWPx1j8GXEl8QpgLMjuWsQXdtpuz5kZ7KE0sFkAp/BeDeNl8tC0j5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TNtaF0DLgYxwre8UJL5XaZV5dHuYhll67t5b/hqMCng=;
	b=Visbrdp0az5agtHlabOf+lRDXs1X8zu/QRo9AU8SaPJiDBYimGT3dv/owADOZq8NqVF3
	 6GQd5OBvFsJrKh2MteySMUN8BH/BB//ovbadWoQp7J7FnxY7WNxzF2c/kmQn8a4ndjpum
	 FV0wdMbbLwYaQORffdEC25yERyLB1bVAUB2ArTSVY9VWjyaQR1pm5gXcQhLYYyn/yTZRk
	 XYKS+0JQEgbBL3X6FwTTKrknduR1jx1Yfc94RICu7TeFPIhcLkUvGp/tLCzKDsOW8oiu+
	 vfzRAQ/GxjtFIQ1Cx6WoApsi8v1GbcG+0rY7yQc6o4u+AwEK0OvOSEYobyPTAWoGhPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IaZHF+2J;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66AD606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B66AD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IaZHF+2J
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-483a66818edso2401418fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795522237; x=1796127037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNtaF0DLgYxwre8UJL5XaZV5dHuYhll67t5b/hqMCng=;
        b=IaZHF+2JdlJMU2soSWePUJeZV7NaDMrv1i4uo+bM8TuyascofftacGsxrs0Bd3Y0SC
         mpfZkFz0PEs6TnU6RaxVwVw8wSnC4/knQp5AqqZgE1er8+j4cO71QeHnhV4l1vGNwaAA
         x853c+3EXzmuw34b7jsNwfc86oV5Nqt5gAqopZHSpQVOsmt5rgnfcubM0BZ9PrsUhzqF
         SDIwSmy7n3I/QZ48SACPSN9IlGbWUabhBwpSGcLAXgoiUNwZ6vd+15W7s0kycUWmDCRC
         ugz4gaZfeplGASpep2JUVORQHmWFqQ/uLU/Ge5IvTPWq4G5WYgxUbnJJm6n6OiKU/Sl7
         Kuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522237; x=1796127037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNtaF0DLgYxwre8UJL5XaZV5dHuYhll67t5b/hqMCng=;
        b=quFuSdXQcukQ4nSpw9o2bAVf3ZsL5VbvmHt3Mtwr4a5l0Fjs9lN5caexas1AUnW2LS
         Be5Gs0oFkAhj1EheMLea9jgdpUdkxc+e3Z22K9S0SY4xYOT2Ngu2SuVAhI3jHYjfnWFm
         iYDlST+DNRhO5bx62gFPSsajjEZmoHTQkl6YlZ/Vi61hil/Grp8eMLxOsHZNsteI0+3f
         /bLq4xtbAvo7vWqpDXUSASkSgek+/Q778vgRsLuLIrxg1cMLG7cJC17c/JVwVqx3o3H5
         yZdQ+hkqJRWMaHhKbRzVhVovVlQyNtAxNAHLMOGQBTLW51erMe8JzMLLhNpjmkk0/MDU
         tpXg==
X-Forwarded-Encrypted: i=1; AL+hErHL/xUB81rn+p0Zlx3IbsubYTqbNqDFuuXD++lzDOq8YgBzpHDFxSl8dvjBQfGFctQfelHwcHrEkw2kHYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H6NGh/fpgy9VP2RMN7cHv5wyOix1kIynIhQpjE+Gs3vP4IdhA
	6cRD5tjXmQVD4YI5hv3b9HcgL3p8FVOsU79VR+Ff4JLt1xOsu1RECn7l
X-Gm-Gg: AZFdTZflzJni43uS4hCY37K7MvOFu3Ev+TgZLaRaBJ3txtftK4qKe6yZdc7dpX4PkSg
	HxKbwu3oRag+DU3D4bJUFav6tBcI+2SSNf5hEPCW+g56JhmMVyvNXwpqRPmcaaA7McQBFeHB1It
	+sBpnzkVflIO7qfYxcekvlTx/2QjWOZUcypOV7JUZl/80YB/y0w6vGdHD8TZrBC1JOczqHzkOFe
	EwNiavLSAR7dUYeifVIk4Imr0cRG/bx3pjUpKCDyK4wtsI7XHfUbjEHy9YChhaWTvC+Q7jixZbr
	NsRA4wZNluO/bT7wGUc7X5ilhwUzWnJvGsPDpytblZI16JMVqALIetki1qkIIxEjK19tCHtcYK+
	IXmFB94J9rP93U06zyNUtQPhmcWNNfWjqENFJilJYfPqV23SCBl/7Rg6W1VTkH9wvHaGrNNmkJo
	XOPjUvh4z6CYQcPtsRJZ4qdWLN0XQrRaN896gmxnOldEMIgxUxEjibD5laAbSuSh+WhgcNg1VyC
	AEOsU58Fi2DFStHTSAzB7M+PJ1YhJsHvHlGF0fr4KZhv7UlyhZPmuVcOAB3wSJVKwYOANIQbaUp
	B95OVuR4BhwLPe+/fhK7W+o=
X-Received: by 2002:a05:6870:e08e:b0:48f:e0e5:a1f8 with SMTP id 586e51a60fabf-4bc8492648bmr14119241fac.44.1795522237361;
        Tue, 24 Nov 2026 04:10:37 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:71::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5ebdc0acsm15053309fac.3.2026.11.24.04.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:10:36 -0800 (PST)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Si-Wei Liu <si-wei.liu@oracle.com>,
	Jonah Palmer <jonah.palmer@oracle.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Kyle McMartin <jkkm@meta.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] virtio_pci: limit Oracle DSC2-200 virtio-net to 48-bit DMA
Date: Tue, 24 Nov 2026 04:10:30 -0800
Message-ID: <20261124121030.38490-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261121063742-mutt-send-email-mst@kernel.org>
References: <20261109184253.531677-1-vlad.wing@gmail.com> <20261119200654.1048266-1-vlad.wing@gmail.com> <20261119181557-mutt-send-email-mst@kernel.org> <20261120171435.83458-1-jonah.palmer@oracle.com> <20261120123500-mutt-send-email-mst@kernel.org> <b8ff5bab-d08f-42b8-9c88-e4665ea3078c@oracle.com> <20261121063742-mutt-send-email-mst@kernel.org>
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

Hi Michael, Si-Wei, Jonah,

Michael, please keep the quirk in your tree. A firmware fix only
helps the hosts that receive it. Hosts on today's firmware, including
those booting stable kernels, need the quirk until their firmware is
updated.

Yes to 51 bits, given Jonah's testing. I will send a v2 with 51 bits
to replace the version in your tree.

Jonah, Si-Wei: will the fixed firmware be visible from the PCI side,
for example as a new revision ID or subsystem device ID? If so, a
follow-up can limit the quirk to the old firmware and give fixed
devices the full mask.

Thanks,
Vlad
