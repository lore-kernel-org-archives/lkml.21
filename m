Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077628;
	b=rtOVJHPHUDQWsGzmerlB0Q3goSSe8UdPkIZnMGU2qVUE4Y7YlSkHaYtcxgoWncvEQcnr
	 8yHOjdNqlc91rJEsBqObcC/oBJWZbx2gLRFaOrzRO+GwDweKM7JWiw/zTIUAgJSHKfECg
	 A+aMOvU7a/FnVZgeH7HXv8YdYoo1Ybds+Tc+WBfQzqR7e9VqFPPbArKhJIGWIpxHDEDgk
	 RchG1eQbqu+dVshe+KNVLGNY2VI1AG//e0UzMKD0ZyG2OdWvq50KmpMmXorE3Vz2JPoZS
	 ZEHhg0JbwxurQqYc3CyrSkm86MhuctB2dJw0XhIUQt1TZRhf6wBZyHWeX8AN/AmCV4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0b0WtnuMp1Hc9oCcX/1wKyrcaG25GmnFWC+LVdfeHYI=;
	b=cliPQx0nnKBzeUho8vL21c4RIFoHXs+0sOIzcfTEhX72s3j7qwJebnZRN7ltQS+FqWAc
	 AheAtKN6Hn0OirVcxpF8PubN0qSTAaUyrs7ra604EVO6BpxKIh1fq177nDwAk+3o94B4X
	 k2RwJjhMesbjK/smppUhHJLuWtgBAYuz3PSrlDmm8MhEsCJyuJ5nDGsLiBD/A3KmiW94L
	 4NMjyA86+FC4BJidbeELRnQDbrEDdqg2Dy+Ens2M/iFP+EnyZsutYK+VE5lBOFAKOop4r
	 aEdDWnWww6xMqa+/3OoUFfPgiILIuADLwDFSxAUoLmj33Jz/21eUObNFkA9cl6D72JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W4/UzYv2";
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AD4606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02AD4606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4/UzYv2
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2efddf749e5so2920345ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795077627; x=1795682427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0b0WtnuMp1Hc9oCcX/1wKyrcaG25GmnFWC+LVdfeHYI=;
        b=W4/UzYv2xIe5ZLoHSY2yvf69V5U1B4se003ow30pCw9FucMEdSEtvxJp6Nj/xJhprG
         pfNvQYaEdjkK5gWFq/mThHM2m5eS/zmFIxU30re+RWgqshoxPd8kl1QAdhd69Z0w1Ahl
         Kjq5UldcxIK0hcxpUqTGJZHolT5ff5XPXYgrc4BDadRQHP/74AceFiHmDkzAis5P7VQi
         2IGdIO+0LNhcvwT1G640kZQH9KhPoZ0fTMad8UhPR275pMHVOWgNGyCbweUolVy2iYX7
         5T6R0hcCPAscRCXJQSzh9PxzhxynFGJWftp1kZtH80dCLCvTq9n58pfNBYDwiSAhRmAk
         mIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795077627; x=1795682427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0b0WtnuMp1Hc9oCcX/1wKyrcaG25GmnFWC+LVdfeHYI=;
        b=A4E7cPYpXMGEko+GooiugWBRnDHIY0FyyBVHbdKZAL3aHe8BXz4cI1aII3hnS3U6gD
         Udvg2MHRhCD/3eqSWYjfn1oSBOnSTl98zHVlrkzkFaMCOcE1aUaw1M43inciSS06UgXE
         nEeNM1jjkSigU9CKrlYXQXj0Y9I8arMjtpz+1KpYLUdrnVjGgnLJ7Z3v1dRWedGuqN55
         beWemRkMLtt/IGkWZTW1UF1Xs7dr0nEnppkf73B5oIyv+RKIdYcZJBMJQUon3+5srO1Y
         bmLEguVYE4PFAPoJaoW6IaLpZllpT0lgnfWXzOR4zrFe59N+9G5WKT5qEP7g/1mpJfIP
         FcBA==
X-Forwarded-Encrypted: i=1; AL+hErE3BRyh1P06e0XW79scEeRuDSJf9Oz8Gn08K6+VESoufqeLZhtgc0UD1Qn4+SsSE+fepvCofS5WMlmggbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LLX9fKTxhBRP3dwYBlykqJf7hBzcyUZM0icWqAm4/cF1EBuJb
	lGJ7m4fjLGubZGR1r1P/ctcLgx/pipRtfhp2hdB31q3OrzWzm6NVWWKW
X-Gm-Gg: AZFdTZemE9/pXB86muWhN2k5iBlcNQ9ZcjKC4DiIAgT3dqLNqzwEmJyVL8NMAO+zG7s
	JURV2c3DdeEqwbe/5UZEgmtse93VHetfl4bpx6sNlc5AjMfFNyUhj9nxKPPDeL2cBPeibhhdV/s
	dlBOR4mQXtt2vaMupJFP6W5mu/R4bTcBggbWzRz/g5vWYjf97hPh44Da30VLctOFGaRGzcts8Dn
	TmYFhjJ4wR2h7cuy7OwTj+6Lf/GfsxS2eOVYWqs2iHt+Jr/ihhRJN+nz6BLtDi8ygF7iq7JhPSC
	o83RHQWQTPZYXQ+dI4sZ0hdRJ/7c62r+v7r5z8rHgnXfBgFdyQ6EhITG/fGjJuJBSmULQviKwiQ
	V4lRYMvRztDlvI/YifdmGnjPuXPssq1bN2hBusCKScSiMV1T5LJNts9tZDu216wzt7JOFwGDSlp
	3PnkoMJt/jvd3EKrxS0HL+cEb9TYe+Ts9F/0TqHOEoOXMWnIpUsxIUpjambG3Kg6d5fNcDLN6Fx
	SDPxOqKbbgt5hiV+ZsTfDJ2B8AH7xYujDNFDl31xHOfP3LOOM+ILIyo7bhIH8sY8WExwDaCefem
	x8OpGhMXCH3nc+beFEVc+t/rC4jxAh++ZbOGMFu6vVxqWUgGw1ZYyBaiYyl5on7zusZqvA==
X-Received: by 2002:a17:902:db06:b0:2ef:db5d:59a6 with SMTP id d9443c01a7336-2f031cc67ddmr3577165ad.23.1795077627055;
        Thu, 19 Nov 2026 00:40:27 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62a9d47sm27425995ad.69.2026.11.19.00.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:40:26 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guido Kiener <guido@kiener-muenchen.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] usb: usbtmc: reject a short READ_STATUS_BYTE control transfer
Date: Thu, 19 Nov 2026 17:39:59 +0900
Message-ID: <20261119083959.1599898-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

usbtmc_get_stb() asks the device for three bytes of the READ_STATUS_BYTE
response into a kmalloc()'d buffer and only checks that usb_control_msg()
did not fail:

	buffer = kmalloc(8, GFP_KERNEL);
	...
	rv = usb_control_msg(..., buffer, 0x03, USB_CTRL_GET_TIMEOUT);
	if (rv < 0)
		goto exit;

usb_control_msg() returns the number of bytes actually transferred,
which a device is free to make shorter than the three that were
requested.  When the interface has no interrupt-in endpoint the status
byte is then taken straight from the third byte:

	*stb = buffer[2];

and the caller hands it to user space with put_user() from
USBTMC488_IOCTL_READ_STB and USBTMC_IOCTL_GET_SRQ_STB.  A device that
answers with one or two bytes - with the first byte set to
USBTMC_STATUS_SUCCESS so the status check passes - therefore leaks one
byte of uninitialised kmalloc memory to user space.  Both conditions are
under the device's control, since it also decides whether to expose an
interrupt-in endpoint.

The same leak was fixed once before in this driver: usbtmc_ioctl_request()
bounds its copy_to_user() to the number of bytes usb_control_msg() reported
instead of the number requested.  usbtmc_get_stb() cannot be fixed that way
because it reads a fixed offset, so reject the transfer unless all three
bytes arrived, matching what usbtmc488_ioctl_simple() already does for its
own one-byte request.

The check is not limited to the branch that reads buffer[2]: buffer[0] is
consumed on both paths, so a short response leaves the status check itself
reading uninitialised memory.  USBTMC-USB488 4.3.1 requires the three-byte
response, so a device that sends fewer is not conforming either way.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/usb/class/usbtmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 51cd9320a736..c5b91a446a72 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -506,6 +506,10 @@ static int usbtmc_get_stb(struct usbtmc_file_data *file_data, __u8 *stb)
 	if (rv < 0) {
 		dev_err(dev, "stb usb_control_msg returned %d\n", rv);
 		goto exit;
+	} else if (rv != 3) {
+		dev_warn(dev, "stb usb_control_msg returned %d\n", rv);
+		rv = -EIO;
+		goto exit;
 	}
 
 	if (buffer[0] != USBTMC_STATUS_SUCCESS) {
