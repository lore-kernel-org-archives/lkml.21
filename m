Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413033;
	b=2x/NSH2rw+RDaVBHocYswkM03HuhS+EttdnjjVZJT8mbj2DXOJfzJbxqzKsOJaAjnVAy
	 A7orJ0bXnOMIVBU+eoQ3AMY5JC1NuSxLqct79OsgUTcBzLHV+vPQO+me+0tQR64gZ/g/G
	 5fUkcGpf0zYSMrKCDLYi2oID046FGIrBTvVoAIBLxK+wih4OBQnZYq+9zaDixHpscAvX0
	 OjQH3h8UvGmFj+29+I/C8Zq9SAblkUmMSOei9YJtAWuxDGNdB5QeRCvuzQLc3ANfzlvnk
	 7iB6rxq/a1XaKyuW7iOlM8mf5nth0ksI69vHNfc45O/GUBjvkDjQIbNp4a1QaoXs4+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bt0cUEXTI7dUekcDjeqTXI5FDAOcmfEP0NeIo74aoCU=;
	b=Jh8dX/rroWtVmMoGKH2usDHyYbDYrn55vUw4mBN8CgKHQpT9HoQYx5dUr+zJT+m8bxhJ
	 gvhlIdnDeVzIDDQ8Mg8qoYe///NI2oWFFRnegiwVul62fBRvX6iAJq8VJup2sC7cu+XkY
	 PKW2Wo8AzOepil8FMSH9wyROrwacZNQCM1FIPkhs5kshhq9x4Pd/vM7kc73V1SZTE4Ogn
	 Thhhg7Ys2S+7V5kalKgpBpgfVOKqzUQUSnqoqIOa4k+H1cxdxFDipsrZ3wdiRxofJewuV
	 tSFQuR6Foyr0BUFPjakBAJEugfnPE77yoHkN8HODUvTQLvVVqPeveNpm0fNhtFk9tog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PayeCRiX;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D05606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2D05606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PayeCRiX
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f06ff94acfso6252815ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413032; x=1796017832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt0cUEXTI7dUekcDjeqTXI5FDAOcmfEP0NeIo74aoCU=;
        b=PayeCRiXIVnHHUvcjWZXeEtBF/ULR0xNyccQGnw11vgZqCiUMnKj+3hDQxUxZICCzD
         6ktY8wUSm7f45XZR1zvi1EKrijmEEHk3+Kuho+k29EBLY4+fGEfo73BCc4Rkusl2NUJ9
         8qXInEtnOU1w4kF7bQGu7QRMj8L/Ktwsa1iZzLYgiq7iVvu5EJGMWBrwDitkYcYW7AaT
         SQo0CNeXSYXtyAojZCM4FkeRjYo4Q/Yi21JKxCVxAjyXHrBvJOSEoqTqULuueE4R0YwD
         0JG4RGRGs+qco2DuuUYcrd+oG8ggOWAz0b0vSkfA9jKL2skyc0n0CBpaT6GZyUU4H+HF
         F7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413032; x=1796017832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt0cUEXTI7dUekcDjeqTXI5FDAOcmfEP0NeIo74aoCU=;
        b=BZzCAP4jlfe3Jt6O+8Gfw+OM1Qg4d54WqUSNmGp7vjd5IYFK6ugZe+5z6OKfdHxzBC
         0FhVAD44g3GRjbLPGmU2z0UdfwOFASZqDYOfRXqnfq7qLojCRjvCJEA9WGLYR9xY3RWq
         be+nm7JBoNJbC0WUL7RZTwmRKcC6vkvgbe9UOGnxXLwkXmM2vl7OZzwi+IQt6ub6CLT2
         k5dJ3liP8BxSkm1aakmY3Ch4hRu7hep6ffio2Hm0jdBO5fruP8CIHH7Mi/NXcAyKOJUn
         QPo0MRxomOe3/fA4QJjL9H0XIpxgltqok2BaSygqab1A4sbiRAbUHzEeTe2MRXLBQfuk
         rpgg==
X-Forwarded-Encrypted: i=1; AL+hErE0NFpWbWW9NULIkyEwGP4254dQm6MC6yc2nKESNA+NXPeDRr3CrEJuBi20vVQVGbfVdTYPq12I8jqzKfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2FkQADLW042sb+m2zKS10hMbLZGMa8BCS/g4bzTecT9fQUfdu
	Q34QVyKEeLuY+WHy0dbiJxJ4Z5p+p3DfcsgC94Ox4AHp3L4ramxsS4uU
X-Gm-Gg: AZFdTZfyt7Rr1GvTdR+eQ8gc3a0OG4bVVageh5jgAxk4WPGyHk6A9UkQU2jkp9s1MLM
	kaPPThWuqHGjYe2sW0ZJufkGCflF0r2QQZjO7yp4rqj+IM0XxefOv+HyZou5Pxbyi1qhvMxL662
	A3VZZKLL+ojH3n8/pzzh3IU2GyZ3sGqAtjtZwvP5upBm5nezYxKTcMk87KaKzH9Duuzaf44q3j3
	Bk6B/A1Ub2QNQutz34w9AAyqPCfB3rgvRBQ/uXTHB24Ugvks3Xq0F16sNPnrFBxGUiIWAQLtwo8
	sOH0ClrgwqYo9nCpIYX3RDjOTRMYBH/9SaLAkwPZi9XSHASIJ3lTi8Qdi6R5jpg4FnO2wCJJzXc
	iJeqtj9obS9XDm7bBb74rxJgDvwwKxcAh7wJS6ujLA3wfEwKICyQub57C6OqYrQrFrZyq66GOM4
	WIxfV6GYer5ynnRk4LzSYPMz6D1esANOjvbijnyI2jqBbq4kB43flursb/EpyG6gERn6pIK6C3D
	ghXyYOKYq7phDu24y32BKbAwSODfDlDbDbA8DVJZ1Ogkv5XFoODXs5pyFxrV1hZR46coXRjy3PC
	PbnoEUkOfxovc1WEAWEwyfZP75R0Xhf6l+W5UWIdejHSQOeIqmuVgp/SfQ==
X-Received: by 2002:a17:902:d2cf:b0:2e9:4e83:1969 with SMTP id d9443c01a7336-2f03f146b90mr99026145ad.34.1795413032031;
        Sun, 22 Nov 2026 21:50:32 -0800 (PST)
Received: from hanzj-mi.. ([157.185.136.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm47076715ad.75.2026.11.22.21.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:50:31 -0800 (PST)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: gregkh@linuxfoundation.org
Cc: andreyknvl@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com,
	Zhijian Han <hanzhijian1991@gmail.com>
Subject: [PATCH v2] usb: gadget: raw_gadget: fix memory leak on connect event failure
Date: Mon, 23 Nov 2026 13:50:27 +0800
Message-ID: <20261123055027.1141887-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026112020-sesame-uncut-fc8b@gregkh>
References: <2026112020-sesame-uncut-fc8b@gregkh>
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

gadget_bind() allocates an ep0 request and stores it in dev->req.  If
raw_queue_event() fails to queue the connect event, the function
returns without releasing the request, leaking it.

Release the request before returning in that case.

Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=d83b3c49738aea97c0e5
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>

Changes in v2:
- Fix author name and add missing Signed-off-by (full name), as
  requested by Greg KH.

- Fix author name and add missing Signed-off-by (full name), as
  requested by Greg KH.

---
 drivers/usb/gadget/legacy/raw_gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac7ca..33d70b552b6d 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -316,6 +316,8 @@ static int gadget_bind(struct usb_gadget *gadget,
 	ret = raw_queue_event(dev, USB_RAW_EVENT_CONNECT, 0, NULL);
 	if (ret < 0) {
 		dev_err(&gadget->dev, "failed to queue connect event\n");
+		usb_ep_free_request(gadget->ep0, dev->req);
+		dev->req = NULL;
 		set_gadget_data(gadget, NULL);
 		return ret;
 	}
-- 
2.43.0

