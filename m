Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785902;
	b=mox6MTfObjHv5W3Z+B0RXJ5yT2bzds60gHW60TgPqqA4oUY7/rMTvNzP9uoa9DAVAo6O
	 HHNCHrleBxjYSXlZpoOm6ATW/nxJlyRUyGhUaDayfSf3BQxrEgtB5Bjbn56n3it74shq2
	 2A/IDm9VTUADh7EDAr583hmwpJtep9Rj6JiBV79L8ifxbTsYjgwfR6zhTAomX3QG80qXx
	 cBXW0pX5o43sL9Oqeln70mg0RUGKvehZrBEGbqxADHhvO5/G8oNtN9d9NeTksDVpiT4UJ
	 bXlEDh2kE3PVEPdmoAeDd4c9cKS3OH71X8Bv7XMdJBZAa+zPOZc+Y1BDUBbB7RJ8yWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EaXmFR9xiZjm/bYgzq3Og9ZEDuO5qEafv1Kq0+2IVmg=;
	b=ToXE41yi5c8+JNtHS6UNYQdkxpNKi1mXs/6NboUbhRYquCohhY6oZ6c9gbfaKrSPYWCg
	 UA/tW2vgoYJBSZ7B1NCN5SgmidbXcTz472S1Yr7XAosMal++ogZ16/amr0rDS8P6XcsJ3
	 tWRYcJi+0/6KgQ7pP5O8+KBgVOUTzKr9D2tyj7T3BxIZHpW0KuAdoSSnW5lWPD7bMp4jB
	 kWN+Db2PXni3ODcSkMY9X6JK9pjJovU6+37KGKzct5lHQCnOMkxv4zsqdzupmCjnkfDSJ
	 AhtsJ+VDlVG+Wj9VdvpmrbvidCEyaf0Vsc2Utc1QZH88uEXKulbLXncFd/ewdMe7mrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJyJWX+z;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0322D606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0322D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJyJWX+z
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386bd881d39so9144317eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785900; x=1796390700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EaXmFR9xiZjm/bYgzq3Og9ZEDuO5qEafv1Kq0+2IVmg=;
        b=UJyJWX+zGA5LzPEZFBmS3nTBbpkbcXcfLZi7A2mPmYVAMDmVViSKq1poWGzSXwi3yv
         Vq4KX+pIXg/T/gFVvkV2vU0FwhJp/qCzRLyufG6UzXENBkGtp2qMWL7qaO4925zhFyt3
         DS+ehIzD1dec2zdBL92CCYqXGDb75aI2hmh5M35at1cm/bU4f2qfEKD8lTiZGp2KG1Gl
         6DimH7IMwTS/XApsHETVQVoECpB/MkB+lCwxvCwAkp7fahkYLMCaLElsRCrb+AXfDwHQ
         cFD8uTnAz2M2/0mhBsHNiDa7VdYswg9wN2MEMF/diZtYHvSJr5nWYFC2NLye+r6CenpE
         pT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785900; x=1796390700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaXmFR9xiZjm/bYgzq3Og9ZEDuO5qEafv1Kq0+2IVmg=;
        b=ndFnNyofnPyqf5HHaE24yiqRiQqTLQXxndA+fDJTF4ip5FaP+qYmj7sGbtPzApPIzu
         AeNsA5S9GUoRXkQuT1KF9FuvHk6efVlCHuYpJJY2lDok11uMSFyLCCqw0QdMgZQVvQWC
         oeTZ6yANgO/lYizDZHMsH3OI2hP1r60DFAfGT8o0tnJqTbuyWM4lqVcGTMomXhpvUMmw
         MulSvDcGH97omibmIZrVQBc/6fRkg9HMaOxe9+5JQi1CmfRaEYUz9tp5DsHu16ItMo+b
         JY53AwbXVoc9CuQeHlvDrJR+GcAIdn7g6oJweDye4+DynU7YPnsGqn3AootVCkM4QuQj
         ZVNg==
X-Forwarded-Encrypted: i=1; AL+hErFOylSid0f9mmflVigq35EbIOT+PHqNhlDzVFzmwt5CRyJhOedWEfwYA5Tw1jNHahtirTNFH0CyNJGPjlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gmQj1w1bIr5MyAAtLCjtdrB8ZYNrUGOEI3EPm3QFsQ7mywOr7
	AmAO9uCx3lFPc6vozfWDBjdlchiqUTWXyQggEYN8NYO1kjRbTfx+7lj+
X-Gm-Gg: AZFdTZf4aulqKAS7likZw5Se0KKqniUdOefm6e7JMI0SlxfPoOcH70rmR300oQT/fhP
	7WMyEf9n76h+6qVhRRJ5hrZvz6Qu5P+kkGWJ8keKv0fliFmhZ+nP/sSkkoH6SHu2tLR1KaJjLTE
	YBLp2wkHSJWRNVf2j/1MAn5e5s8eN/w325hgJho9jYL4iR8Rsmvf27gC2B7nHlmgXBMCnCN5gwQ
	0R1mI9TfBeslCmQXHFr7vGzXHdT7UxSjVZU6AlcYB5XGSjMVqJcPwfrmRE53YFE2O7QuhDogAMG
	rYTVH8WEeE3CTxN/5tMxAwQRQma22Ffr+3nlRJ3NxdN72+dxDK3P3G4pi8rBMRzEZKlO9xM7R4s
	A08PVIV5fo6vYNDAPXc5QWafR/WjG17MwZvU86RsNNRVIVwa3ObXVf8ccbsJ1uIGSkLpECRw1+U
	RKHVMB2N3yhytwkBU1Lo5T2hGxLt8pX6NdbvSto82sKtcYF/vsxLCqSLYDtsELPk23OByOkIH0Z
	QvoLNW5CSIv9lmjGKL+UNxHcxOSieEV1FZtdwWSb0oIdCgVtqa5SHNRLn+sRyQc+JP0HKd62EGU
	PPqkg5agfLAg8oImmkcZuEtqMkDUYK97qdX5djNP5qQjDHUA3LEegdlr9HYnsA2j+CeY6AFBEw=
	=
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id 5a478bee46e88-386a0c0757fmr21634002eec.20.1795785900079;
        Fri, 27 Nov 2026 05:25:00 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:b15c:e4fe:6de1:494a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm59082431eec.1.2026.11.27.05.24.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 05:24:59 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: romain.gantois@bootlin.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v3 0/2] usb: typec: mux: tusb1046: Support no-hpd
Date: Fri, 27 Nov 2026 18:54:47 +0530
Message-ID: <20261127132449.89081-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

On boards where the TUSB1046 HPD_IN pin has no usable HPD signal,
configure the device to treat HPD_IN as asserted while DisplayPort
Alt Mode is active. Describe this with no-hpd.

Changes in v3:
- Describe only the hardware condition in the binding, as requested
  by Romain Gantois.
- Carry Romain's Reviewed-by tag on the driver patch.

Changes in v2:
- Use no-hpd instead of ti,hpd-in-override, as suggested by Rob Herring.

Ajit Singh (2):
  dt-bindings: usb: ti,tusb1046: Document no-hpd
  usb: typec: mux: tusb1046: Support no-hpd

 .../devicetree/bindings/usb/ti,tusb1046.yaml        |  5 +++++
 drivers/usb/typec/mux/tusb1046.c                    | 13 +++++++++++++
 2 files changed, 18 insertions(+)

-- 
2.50.1 (Apple Git-155)

