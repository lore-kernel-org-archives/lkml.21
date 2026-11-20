Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208627;
	b=U+gIFvouw3jODqIZ0DOLj2O5qd4dvZ3EiU0oTedL8VOL/Qa5ta/EvnFDbLEopZbuymxe
	 xnADhjLImfMzZtGtwl6Jvx9ILttNycGOFIAZHe5TTi0TtlZwQ10E1Lv01FMhD72TMkO7P
	 fXfldG4DM8KAqnM3VZ7igeLdoOMrifSoszBHj8cTjN9ruBwztnhnzZ/KIpAB4NVWpYs3m
	 5eFFfxqaoMNXfbm2AKz4pSXSFIB7iMxNvy745eUSiv5LJGwvopzbEOdw1XCRNRigEMHya
	 E52VjCyOVmn9aay+XbUroY5HXDw7EzyEqn+aF+13jhvKd5RPPcmA7hGX5Lwi3w6MhUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4hK94eNEEKjazlQ0HP7i05TipBfA/Zk6tSc1DEj8pPw=;
	b=PhyHdNMI9z0iNP2+AmFpGi9dA1iM8v1o1qsTZEh30U49ggUWbSBjlETUwb5XBE7fuvP6
	 Wr5PHbqbk9YuOXUMp/mk72eHYpZSrcmkJjM6+xMHn2R5GjCxWu38hVMZjIB7N6OfWDELN
	 8JMZXJRttH2ycOiS3Sw7vYaogInSm5tnnpWH/ZGcmtcP7GGd5YGuDbd6QbZ7Khe2u1AqW
	 dE8HlkraM920wWGdZidiPeUMXpRQBGe6fAinu3zGTC4AaMJT3CslEo7d5gDtgU5l7D5eH
	 1mksl8riN/5XgR7yrQqfbHUXfhLQ8kNrjzltSu4zIMIFbLoSrb1Hi5L5AMsYRdClUJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zyVDb0g9;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB19A606A682
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB19A606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zyVDb0g9
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1395088c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795208620; x=1795813420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4hK94eNEEKjazlQ0HP7i05TipBfA/Zk6tSc1DEj8pPw=;
        b=zyVDb0g9yNO4Zk/jlweqhoNreS+trSst0WrNaXSK85spzN1Hm+va9kymYhXTiIkrOZ
         6FHA39FcBFpPKPtAwfQCnLic+8e7hytQSDcPHi+lURZxiDryHmnzvcIC8uiehjjTwh1b
         4k41EJ9+7wMzHK649P3GmSd0sC0a7G1v8z9NJmor1m4v7XqLftIf9qCEtLw7TmwhjSNu
         R8dfbLW8taucG3PW4x11LMxJU6690Q15qL8BvYjU/gbv4xl2SGmrnIu0ulk4la6tn5DA
         UnjyfDoova+wX1aiSzQxv26uOcfDyqDe8ml6hru5SWzrrSPw/CmeJQjN2tyvwC8fupJI
         VOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795208620; x=1795813420;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hK94eNEEKjazlQ0HP7i05TipBfA/Zk6tSc1DEj8pPw=;
        b=EMpTulD2qwtLdOsCxuJdmXY6+KRvJHZVNs2rZHzmtf1w7Bj7/0T3TNEi1rspoJCct4
         3/68CdNg6ztYOsUM4ce8aomJXvTr/rYJiM3hDwfrj3QOnKx+eqAII3xphh1b6P1lONWp
         QgL0kZyjf/Y7pXYKdzZiTg8yF3gCaDdz4S2gUJrvDjLQkxToNR0dLWdG+oSXO9JiYtn2
         BWguYgYnsPWUKsspQcFMyOUX3ULZS2h1tAedQIK5aSKtfQ903+u6fEVT5DRdAZ6Zqn75
         h6o+vhlsO9u0NXHBB60yHi3nIhQidEdjwP+pFSmKqsq/PfQ2D7sxBTY9xMu0hvSZT2zh
         yOhQ==
X-Forwarded-Encrypted: i=1; AL+hErHY3Zn5ZJj1Sko+sbxGQwRegnrCGfJUXzmnSnjvbBjRNQuc5fnLoUgMn1+rpofIzP69chKVjuv1da7JxQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q5yNAG7v9mZLi19Da/dFBzvR23nsMuLSfiSdwRXXxwnC2jPde
	dYcvf6sVMJDAK1vv8g+xmacH6Muh0rohpmEXLA2+RKL/XK8CdoKF+JRE
X-Gm-Gg: AYBFou0fE0XgoobImnMZW4SOtTkhGFlHnQvtx0Zq/1A9aOGzQ3ON/8ZzXF986XD8Z3u
	bLnFMEmpj1uRRUmjW7+onOE1fNyQHfwPp7UKCTWbxrRRsZybtg0OhK40XPxNrlwtkddmxcCA+gR
	OKO7Uh/iUw34WpekiHBsSbLyz3ur0uKU446APywuTtt8wkitV2+MVR7OGWmKPF33V+tyUcDXSdO
	Y84LcpPOSs0LtULY1yzbglPWCXZe3F3DDa98Y7kmm7a6sCulvZEevaRZ36xVEigd8nPXUsYqRw8
	GLvM6ZCahhI/AgGWd8f5JYbG/zXnkIIOOC/m6aqHZFugmLBtKA9zvkOzk0718pd8KhxW4elGN1b
	8jQW0oJsxwwfN0/82YtmJX57xNmlYWJVYqOfAEKyqv4ucnA40ZLxS8IREBF+iMYw0Ijajz96HT8
	86XoxHgaoL7igLv2brikibkLX6NAbcVqZEstYTwue+BWl+4vHSEaecjNez2Q3jxYk+8velfLsef
	c+b6oyhnhWPq4ePpBj9SjeO8p4yPRxEkcqkRwvTsiEqTLhR9oFQ6Mtz3hxyCsan5WJ3Zs0G9y6N
	zsr9s/92JBL5X1EpKS+968izifnh2EilMdqy4zeRPXNyykUk4hiF9o98mmtxXwyIp2YFHEKo3RE
	NZ1e+a7mV1YjcxBz8DSBEnQebf5FCm6Pgn64N6NA7hLtb1FCOV2EzHI9tUHrK2neJhVV1A4jkY4
	RXnvpeFu4L+iWP3MWmnyPVmmNWzVuwPujVre7yIyUemA==
X-Received: by 2002:a05:7022:3c0c:b0:149:1b5b:1f25 with SMTP id a92af1059eb24-1b55688bbeemr3318551c88.15.1795208609113;
        Fri, 20 Nov 2026 13:03:29 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm8865172c88.2.2026.11.20.13.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:03:28 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: iio: Keep the buffer index separate from the acquired fd
Date: Sat, 21 Nov 2026 02:33:17 +0530
Message-ID: <20261120210317.184756-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120061903.98141-1-zhujun2@cmss.chinamobile.com>
References: <20261120061903.98141-1-zhujun2@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 02:19:03PM +0800, Zhu Jun wrote:
> IIO_BUFFER_GET_FD_IOCTL takes the buffer index as input and replaces
> it with a file descriptor on success. On failure, cleanup can mistake
> the unchanged index for an open fd and close a different file. Only
> assign the returned descriptor to buf_fd after successful acquisition.

Checked against iio_device_buffer_getfd(): on every error path it
returns before copy_to_user(), so the argument keeps the index, and the
error: label then closes it because buf_fd >= 0. With the default
buffer index 0 that closes stdin, with -b 1 stdout. The patch fixes
that, buffer_idx is already rejected when negative, and it applies to
iio testing, builds without warnings and is checkpatch --strict clean.

Reviewed-by: Arnav Kapoor <kapoorarnav43@gmail.com>
