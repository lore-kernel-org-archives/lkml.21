Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640440;
	b=l+adAhz5tK+aiU2KTBHXQTHAnmC82dswUeHykuqiXTnrVc7z45v/kt7m1O0mQfXYbYTa
	 M5Rz/O/+MeQg4OnLdujCe6ISD5AegDZYzy2m0RPOOAxQVilUWe6+RsqCXjPnC7YgTOh8x
	 elwa0T8WBBk0+Hw1xMnLKO0CdilZbtxyD/dGwJ8pUJwAsOI8coH9WajIIeWLYrE4vYqH5
	 QQHkYUJLmRqpzx5V6FpjcSvy3DdpclU8PTRRIEGruM0k3bseID6ZzGD+U9/0wB5G87ZOq
	 ug5u4w/+4Q6DjrWQaI3M2MriXAvkLUkrIOsIEaKmk8WEz0uxgjud935jxBmCp/NYsPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=63egZoYTiZRkcU8bAbviisltXbcArGRBXHQbY8br8Ik=;
	b=x0TCTxbbHBbhTfbyGgGvBI0mVrT0N8CsGgKFge/cVgz1E3stmzOZUIKYW05AvSJXc1kD
	 Dse7ESuCW6DwNpXnE3lB0BBOHir3uTf2VbPrmEPfiTe83kbonh9D45qXhPmHt7j3ZnxyC
	 HUcPfJEqeyiF85XF7R1DuJPgZz5unqGWY3TjmuGOZqvwAUNpbCUA9u6WTpEqfeFM9w9gL
	 gvPovg+Y8/nA8OS3WMnV/T4rs6aNLn01vw83bhT4s0o0Cs8ySTIFQgFYs82NXIZGqIWTE
	 IPSWxv/ZJ1ZUJJhztPl64MfpdXksRWxDmldrguOvSe//82wUo3RATa1jcuWJG6rEBiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kCI2RQA8;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79D7606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B79D7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kCI2RQA8
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso10265832eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795640439; x=1796245239; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=63egZoYTiZRkcU8bAbviisltXbcArGRBXHQbY8br8Ik=;
        b=kCI2RQA8GQqKy1qyCiMB/N+IG2c1aw3bZgpD0md7Lzyo/gLoQZ4ol2vr6h1qUGLVti
         uTv88Nz25wrmN2c6dk4tn/FSbQIO0nDhUDXvzjCtPJRcnK2K4bgKsbKPxW+vGAMGgnKD
         fSrYcPmZNPq+kwQTNg1KWKjOGlPJEE3Q5hGhlwNelemBBoq1x2mJwQg1IAhdfwB6+jTW
         Y27m9pzxsPXKfwC5gJ9GYQ5TeqDAF2CML+FhEAcHmpinYN7mPWZyqHKy3Mz0C8GL+3uq
         B5Q1ibK8kJy8LJQ06q1WZWertzDhpubm31CeRiowmCXzS9Ry+CGBJkXMrrozM9GkbyF1
         qHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640439; x=1796245239;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63egZoYTiZRkcU8bAbviisltXbcArGRBXHQbY8br8Ik=;
        b=GaPuXFp7xVYhdN1pgGgnLTox65yen1MxXQm68GzaToHNqL3DpoBQeVU/1CXK4Tgjkz
         7sPKWgXD83m83c89stjWq5wvFwkl1fLd+1oCDlKUPsl+rKZGbv8ZVg5qQHoK+U5BB2xH
         b7OJ+DYKAfWbo+s23EstOwr4iLDV09+HpbTZzqAflGIepXtk986Y/LyyEA25cCHERt2x
         W9/fBnTe32SVuuRuv02Zb8AYQNDJSZeiOEQ+QPtt1/jv5fQA3WnqrHBUKV9bTOX6ZX0g
         t4nYoOjg07WHj5LZT2+rtVX5AVCUC+vTtZUpWEQqiJn3FJj28Eysqi/RvtnRMIYYHGmE
         NYNw==
X-Forwarded-Encrypted: i=1; AL+hErEzynBrCMhvZ5sHhEjGpcCw8l8AezK6EsZfvC5Fa3N3QQ06uNDyLLLDf8z+Pw3LaJDwdO9yCFEgbA5U2CY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XWJaJfk7qajA//rZ7fI+LgEPGNHtUmlKmS2nTluh0pHe7GTy1
	7kD08nvo7pfSpmALDv6/LPSM+sd+YBpD/m36EDi72HS2mwN6y9Di7agk8nNLkb5wh1d+h5OLrX+
	O8Q==
X-Received: from dycnh14.prod.google.com ([2002:a05:7300:ce8e:b0:36a:17c6:6824])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:4143:10b0:36a:1f4f:3e9
 with SMTP id 5a478bee46e88-386b1067bf5mr11917557eec.20.1795640438289; Wed, 25
 Nov 2026 13:00:38 -0800 (PST)
Date: Wed, 25 Nov 2026 21:00:25 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125210025.1277771-1-elkin@google.com>
Subject: [PATCH] smb: client: unlock reconnect_mutex before putting session on terminate
From: Elkin Cruz <elkin@google.com>
To: Paulo Alcantara <pc@manguebit.org>, Namjae Jeon <linkinjeon@kernel.org>
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In smb2_reconnect_server(), when server->terminate is set, the early
exit path calls cifs_put_tcp_session(server, true) while still holding
pserver->reconnect_mutex and unlocks pserver->reconnect_mutex
afterwards. Dropping the last session reference can free server (which
equals pserver for primary channels), causing mutex_unlock() to touch
freed memory; the normal done: label at the end of the same function
explicitly unlocks reconnect_mutex before calling cifs_put_tcp_session().

Unlock pserver->reconnect_mutex before calling cifs_put_tcp_session() in
the server->terminate branch as well.

Fixes: ee1d21794e55 ("cifs: handle when server stops supporting multichannel")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 fs/smb/client/smb2pdu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index 7b7d25364e20..2fc212593fa9 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -4390,8 +4390,8 @@ void smb2_reconnect_server(struct work_struct *work)
 
 	/* if the server is marked for termination, drop the ref count here */
 	if (server->terminate) {
-		cifs_put_tcp_session(server, true);
 		mutex_unlock(&pserver->reconnect_mutex);
+		cifs_put_tcp_session(server, true);
 		return;
 	}
 
-- 
2.56.1.839.g22a8290db9-goog

