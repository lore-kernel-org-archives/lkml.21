Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173949;
	b=ijYxPXszDz9D9q7BNIcv7sduRoHDFhmNS6u2psiFfvc+9Sg+YX/xAb771gpiGUR5v1ak
	 aANpvNAPL0pNX8nkcxeutFIFkxgVv7elUtOdvyPkaR6dLS05ogiFNggaxHMOVge+jQjMp
	 bKUgzxgRQ7PfUMw4fOJxnct2R2RCvTeZZnL7aUeZi6cnYbimuIIllX62D8Qc7PA50xpaD
	 MugggsvM0qDuimCSVYBCDpe0gFe3dqh7Nl8WpP6oys97O59VBp87XZEyaFg3FnfJwquai
	 w0N8M+SYRq3Ixs3kMmvLNUQhkk+BtOTolRhRdqNBJUII6dZh4Qe4TsUWAgONDQWj7SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173949;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=BlWEHqUMBfqlYT6RzxZzGtNgrS/B0W45FDa8RWpCMeo=;
	b=fYIFPQ6GyQiQkfCLGyWtNYsg2rGT6oT0wnELyfxecGrTfxuUEKJMAm6hwopS9OUPqZLr
	 ZPr7RtOumb1hDrmdU0Xn1yEMTyJv8j9Y6Q3tYxuDbNyKSpNa+GThc1sSUmEu4JiNZ6OCI
	 poJcjIG2+EEcS98sGPp2D7WPgSCdOJJOYUU8qwbQnBcvbwYcNr1HFxM5XXqVDbncEEBjW
	 tqjow1HNtHgB0GJlYqeZU7YzI9h1viGUXDfwGZLKkNnMTTpSeYt35KqyiYh3HgAVw0gDO
	 0sR5nkpy+NuotMrCjtXxkM5Grh31VV259c+1ZQUjgFifIcheoUpdGPQIzca1ie36SJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=JVjsovkk;
	arc=none smtp.remote-ip=195.121.94.185
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C3D606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C3D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=JVjsovkk
X-KPN-MessageId: 1da285a0-e4d5-11f1-964c-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 1da285a0-e4d5-11f1-964c-005056999439;
	Fri, 20 Nov 2026 12:25:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=to:content-type:mime-version:message-id:date:subject:from;
	bh=BlWEHqUMBfqlYT6RzxZzGtNgrS/B0W45FDa8RWpCMeo=;
	b=JVjsovkk/tx7LHPECwSDZYYUnemGi8NT/PGU4bPD3DWrRCynwCeq5TPWbJqrVUgUaaskjS8RNLyNS
	 YD05SNq9d2hUK6em6GrxAnQK3N7iI8yxFjUuHYhKy3sIrNy1da4kjM0z1OJm654Dvop0iitrltDV2N
	 Ve0lvxIVBfdssUTFZe8ajY8EvwPVc7byNEth6eSpT5seYpeqwPh9HT0NDKsiX5eES5x2eRQlz7PVHL
	 xHP1TnL9QWerToxg1iRck3g79X7N4o4Yx2Hcj0x09e2nu0PF+D5NeqIBRG1sesEcObUu8KNBfHQHar
	 iyiISq9FSL2oPWHEp+HLUoQvFKYtexw==
X-KPN-MID: 33|MobqPwOJImcBCc+cLtMGVB255lynkFGkgg5+9Y1LDQhPPLwLda+xj9S/6QarXue
 qwe+L5p+PWNT7eTiMnjv90LV4imoA+q0osGu9DX7/sBs=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|xvyHc0hgKsCcPYT0JUki7vUYMz0ALynJqrDH53NqU1I6Bo+nCDp+3PKMV7KEtme
 KbUcFRvTqJntQxjq2ehp0rw==
Received: from [192.168.1.167] (unknown [178.226.154.85])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 1aaf0057-e4d5-11f1-92e0-005056998788;
	Fri, 20 Nov 2026 12:25:40 +0100 (CET)
From: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Subject: [PATCH v2 0/2] selftests: add option to print the time spent per
 test
Date: Fri, 20 Nov 2026 06:25:27 -0500
Message-Id: <20261120-kselftest-run-timer-v2-0-9802690a370b@xs4all.nl>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7RjaChJX3sOwKDDIxFpIpxIM4
 e5WEncu30v++ysIBSaBS7ZCoJmFR59AHzJoB+vvhNwlBp3rUil1xoeQ6yNJxPDyGPlJAbve2LY
 wqiw0QVpOgXpe9uqtTjywxDG895NZfe2vV/3tzQpzLIytTNXortTNdZGTde7oHdTbtn0Aeerlp
 7YAAAA=
X-Change-ID: 20261117-kselftest-run-timer-df3ac531652e
To: Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Hangbin Liu <hangbin.liu@linux.dev>, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <ricardo@marliere.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
X-Mailer: b4 0.14.3

For CI/CD purposes it is useful to know how much time each selftest
took to complete, for instance, to know which suites to run for a
quick-fail diagnostic, or what percentage of tests you can expect to
complete on a paricular --override-timeout value.

Add a -T/--timed option to run_kselftest.sh. When it is set, run_one()
prints a KTAP diagnostic line with the elapsed wall-clock time just
before the result line of each test that is actually run, e.g.:

      # selftests: timers: nanosleep
      # time: 12.34s
      ok 3 selftests: timers: nanosleep

The other patch of runner.sh fixes a bug when using --netns in
run_kselftest.sh.

Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
---
Changes in v2:
- Dropped convention change from the series (as Shuah requested)
- Link to v1: https://lore.kernel.org/r/20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl

---
Jori Koolstra (CIQ) (2):
      selftests: pass the timeout override to tests run in a netns
      selftests: add option to print the time spent per test

 tools/testing/selftests/kselftest/runner.sh | 21 +++++++++++++++++++++
 tools/testing/selftests/run_kselftest.sh    |  8 ++++++++
 2 files changed, 29 insertions(+)
---
base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
change-id: 20261117-kselftest-run-timer-df3ac531652e

Best regards,
-- 
Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>

