Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795230196;
	b=1PZFFLr1lssmVlrQl9YluyU3vHvZ9g0fD/GC5hxMJELh1CbkSks9BYEpE3gvXEcLbquc
	 VS3p97SxhHYMC8000ddxGX/feqV5FYmrTWjHN709sKE0GKnFXbc1KiBmwhEzVtysIq0ro
	 R/7kPPd+N6MuVxR84P/e+E+IKuj/eklYPMvtCMJSjRWSRdv/ybf5fU/bdAsg94kzb0Pgl
	 4mmTpcgdoaFT1phs1AZRjyEpaJyUayGu5XTyxpsucIGn053wAX/0XBMGGzIZcq19TxNG1
	 0UVTW1oJYHl/T96ulYQpCwz5EoJlH4p15ENRhIDpT0O/jtL9s5M8N7bDZR2N+Moy8YA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795230196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding;
	bh=rVUJnbpQuusTUxAszDMC0A/uqiFf3OcFtCrzzNbTiuQ=;
	b=mZjfikH33VEI9TOndQZDeNOoJco2vLKowoyC95hq5kxCbl4GeEqArZQuTKU7IppDL675
	 u+WMcJwJ3s/IqU2xuHRaFeUD2dcaXMi8UMr8INcfKd7L6RchvHJI/Wgem2zY8LKxnOrcg
	 kTqY628G+RU5QfNmUhlpRgX9ocnZ+WWE+rcMGSk5NfOvfErGZWwIK9eBqM5EGXw23SZy4
	 PCWMsfa4BQogOQX5cbG4vft6z4QPuewwGTnrjhc17NjKJOnbXjeoZSAjyFgQq+jIK8B5W
	 dIh6c+Yp5CYknIqp0dZFnrzMzRxPJoyfqQFRXQQ4xyp0xGHkKKhOfpiFYqIFlRryQQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=perfloop.ai;
	spf=pass smtp.mailfrom=perfloop.ai;
	dkim=pass header.d=perfloop.ai header.i=@perfloop.ai header.a=rsa-sha256 header.s=google header.b=rRwo7anN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FD4606A6A6
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4FD4606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perfloop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perfloop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perfloop.ai header.i=@perfloop.ai header.a=rsa-sha256 header.s=google header.b=rRwo7anN
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-843cf077f10so2057029a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:03:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795230190; cv=none;
        d=google.com; s=arc-20260327;
        b=aRWVaO48qyjbcZVlY92C9mybAvSEQz95u4axhs6xNK3ApSAADFt6RvmfqxwgQGfY9g
         Gt3IhR658yzR1AOx/OAD78fNUSe8IIJ8quSKj63Y99tDlJGpuCFt9eDY41x636S1yuA2
         MdE8FvGjNYZjm5QH8seoh11FshgZ0GsV4GPeLZSIYh98nZM3gxXNRfR519qZzHxfy0t5
         ObARhzZHfUvoNqTqubhXeqkpWRfogNLGgfVBIa6OsgLI+qmYZUiOsHwotuwspPTwXRMI
         jRCN8EQ80Rw8/zTiDD0SmnyZ0+x8BERoIzT3uo8plZR5cXBDH2eYrIH08CBdMXTSj/6K
         B0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:from:dkim-signature;
        bh=rVUJnbpQuusTUxAszDMC0A/uqiFf3OcFtCrzzNbTiuQ=;
        fh=3OkfXjyt/grFe/4RYT4m62LqdHBxSh2xdMoFL7iWtTk=;
        b=Ny2KgCdFDdr2OrmOsqAZYoCqOv49uOK0atzbm59cZyEIGxnhxc0tqJE+mgIgy5nXg9
         jGbrhCOjLnSrtFUQSaETEKyGEiLS407Wd7RnxNdrPJtbc3RHVIqEQ/IWMHGfgdaGVukM
         8I3pkdxBhiqysCOwskQyTL+qiYmYI2RUJRjfG77mdvc4LxP7P253leyf41vtVmbEtMzo
         /ATTGk0hJu1kz2fGZTJMUn6sTHiChqwWavV+OCRXpbn++91KyCPnEZN8bKsg657sNLCO
         xNl1s/4SvRex+eH4D6QgLLpLZTmqwYLyPrzMXoHLmdepV9fxegxHwqcZpayRit3bbJnl
         3S4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perfloop.ai; s=google; t=1795230190; x=1795834990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVUJnbpQuusTUxAszDMC0A/uqiFf3OcFtCrzzNbTiuQ=;
        b=rRwo7anNsDCLQ+X4PaJzGFKJJvaM+BEV2xAuMYP6X0JZ1IfiPol3Ube/WSpRvy0k6n
         DbX1ruex/MxwT9fKHwDjHSwkjX+3tiRSpDP/6K1esa1dneyeEIKD0kNNVam9QA4kaZ1E
         mRZwb8VAs8bmVoK71jrAej+bM3ghcID28z+r3zIzsozQKzTLI76PkQNZEV+oFmr6s7q+
         Y3eDVqesg8miNfCCklRfqsxG4LT8E3hRpRqgwJNjqSywgGAzk6HYsMInqRrxq9DLwXn2
         qx5ovyikV18rWUhiwD8Rp7niYa8siOWYeh9X5WHiySepWhWZOL4mlZOWLcJfM1rWYCTV
         bHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795230190; x=1795834990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rVUJnbpQuusTUxAszDMC0A/uqiFf3OcFtCrzzNbTiuQ=;
        b=Loq3a2/bfjlCdzav0vd9xDD/NirefjS+0KlY/spElV/FLFtzaOvyd67NxkGq7uwjvV
         Sh4Z5HC0WeVIAsL7wPNUia6R4ZR5cwM8A/nDu5GJuqSJnzWG2db4Rqg4N4PyhJTMLl3q
         EzphK1WOl8pc2qMy5AldknjGkH2RPxCXHn18+g6QwIfkXmAQ5NDDftECjrONQXHNAeEJ
         mhICl1i7T/bUlivX3v+NLbs8ZwlkZVds7ezDEbWchhXysP0F+GSYV4qhcBHg+ygQv2BI
         HWrVye07sfXjEagXPzAPMx2AH56+4X8rzAs46gizKgDw0czxZ+NKSUo6GuNfhZg8UCAq
         /J6A==
X-Forwarded-Encrypted: i=1; AL+hErETG9j2S9okutzxLKCusyO1u4X7GmM/N0uxwHrMxnRpX9/ZhPJAzmADKhqsqB3CjIBZDSAU3WDCgrAytRI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iBMfnIgY/30gflTTIlaYeevAkuuxiStTET16lCSgG8NbgiraU
	YYeCaZi++GnvhCNuDj4oXzcLanYqzZ/spxpy6nJYm3ioctFAjLv/Qu4qxtG0dt+S1WAMpWutPoF
	o1e6OiE5ENGRYh2IXTa+lS7phJX2p4+FLzTLMjlWd2WQ=
X-Gm-Gg: AYBFou2ViPp9Lk2supDLkX9hcCUwjdkrkjSDyXY0DNb2Aa/oawI8ZirMacaAItATW68
	Dl/ihirRxqfG2WelCPmilTmTCdcfhafz9eNX2VgXP1tubTNFdjORZ1S0XIJrCU1EqXXrInuiPLT
	P4Dv1iS94uP+6hoKJJ2ELpWTmrf/aq/PSMll7214DdUSD0+rppZy+lctk9TOQ+Hk1iL6pHzdnDd
	lYfB8KktFR2KD6oxlhM59ApyS8YkP2/SiSqKUnfAtWMlC1yYxhjWPMYtb7sTWbGHa5guAgaiJsz
	BkQfBKBD16/+CUctZsU7KxVkLLVq47F5EDy2MAbA4X58YftRJqt3r1mRxSm0bKhqrmKZ27Jei8v
	MrJcYCo+D4qofxHiAeAZ+ZHSwOvaXm+6KcIqM59bWqaZ19l1hdbEq+pYefpazMsdixaRspS0nrL
	KL9TMUlzJpEPBBtn/jn5ZWEux/F2ApYVPJ+Qi8mDVbqKFEdNBOoZQTjK5o1zEJANX5Lq7c9ZwR8
	O93OWoLmBXMBy/mYSv165RnAwCNd30Or2OQB557Rm9jUXlP8Z5CN8HNRNvcQBNYisFCnu+JgLxT
	ST6LwfF8QD7lGbVc0cVdvrkogjQmm3/NpyDiY7/VS/F3I6SkcMI=
X-Received: by 2002:a05:6808:c235:b0:577:adde:c667 with SMTP id
 5614622812f47-57a0bb88acemr5571773b6e.42.1795230190326; Fri, 20 Nov 2026
 19:03:10 -0800 (PST)
Received: from 202080787392 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 21 Nov 2026 04:03:08 +0100
Received: from 202080787392 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 21 Nov 2026 03:57:44 +0100
From: =?UTF-8?Q?Tom=C3=A1s_Senart?= <ts@perfloop.ai>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 21 Nov 2026 04:03:08 +0100
X-Gm-Features: Aa3M54rLD-SY6bY9dqt03stfmGqzPXkYH-ebZVZuKw9_XGkKqv8PrL_ArfLmrl4
Message-ID: <CAEEBa3XJt0XU+5pXNQz_tjZyPEeEnY67i_QGupOnHLnXB=BVDw@mail.gmail.com>
Subject: [PATCH] jbd2: stop fast commit replay at the end of the fast commit area
To: "Theodore Ts'o" <tytso@mit.edu>, Jan Kara <jack@suse.cz>
Cc: Harshad Shirwadkar <harshadshirwadkar@gmail.com>, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fc_do_one_pass() scans the fast commit area with

	while (next_fc_block <=3D journal->j_fc_last)

but j_fc_last is one past the last fast commit block. It is set to
s_maxlen when the journal is loaded, j_fc_first is j_last + 1, and
jbd2_fc_get_buf() hands out blocks only while
j_fc_first + j_fc_off < j_fc_last. So block j_fc_last is never written,
and it is also past the end of the journal, because j_total_len is at
most s_maxlen.

The scan normally stops before that block: the replay callback returns
JBD2_FC_REPLAY_STOP at the first block that does not hold a fast commit
of the transaction being replayed. When every block of the area holds
one, nothing stops the scan. It then reads block j_fc_last, jread()
fails with -EFSCORRUPTED, and journal recovery fails:

  JBD2: corrupted journal superblock
  JBD2: journal recovery failed
  EXT4-fs (ubda): error loading journal

The mount then fails with -EUCLEAN until e2fsck replays the journal.

The area becomes exactly full in normal use. Each fsync() that ext4 can
fast commit uses at least one block, and only a full commit empties the
area. A crash after the fsync() that uses the last block, and before
the next full commit, leaves a journal that the kernel cannot recover.

Stop the scan at j_fc_last, the first block past the area.

Reproduced on mainline 7.4.0-rc3 under User-Mode Linux: mount with
commit=3D3600, append one byte and fsync() until the fast commit area is
full, then EXT4_IOC_SHUTDOWN with EXT4_GOING_FLAGS_NOLOGFLUSH and kill
the VM without unmounting. With 1 KiB blocks (mke2fs -O fast_commit
-J size=3D8, 63 usable fast commit blocks) and with 4 KiB blocks (default
sizing on a 64 MiB image, 15 usable blocks), the mount fails as above
when all fast commit blocks are in use, and recovery completes when one
block is still free. With this patch the failing images mount, and all
fast commits are replayed.

This bug was found with Perfloop, an automated code analysis tool. The
fix, this message and the reproducer were written with AI assistance and
reviewed by me.

Fixes: 5b849b5f96b4 ("jbd2: fast commit recovery path")
Cc: stable@vger.kernel.org
Signed-off-by: Tom=C3=A1s Senart <ts@perfloop.ai>
---
Tested on torvalds master 65e4fd942f72a9dba0e4e257290c4fa1aa756854,
under User-Mode Linux only, with one journal size per block size. Not
tested on real hardware, in QEMU, or with the larger fast commit areas
that mke2fs makes for bigger filesystems. e2fsck 1.47.2 -fy recovers
the failing image, so the journal on disk is intact; only kernel
recovery fails.

Reproducer (needs a User-Mode Linux kernel with ext4, ubd and hostfs
built in; set UML=3D to its path):

#!/bin/bash
# Repro: ext4 fast-commit (FC) area filled to its last usable block,
then power loss -> next mount fails journal recovery.
# usage: repro_ext4_fc_full.sh <N fsyncs> [mkfs args]     e.g.  ...
255   or  ... 254
#   env UML =3D path to a User-Mode Linux kernel (ARCH=3Dum, built-in ext4
+ ubd + hostfs; kernel 65e4fd942f72a9dba0e4e257290c4fa1aa756854).
# 1 KiB blocks: mke2fs -J size=3D8 gives s_num_fc_blks=3D64 =3D> 63 usable
FC blocks. After the first few fsyncs fall back to full commits,
# N=3D254 leaves 62 FC blocks in use (control, recovers), N=3D255 leaves
63 (area full, mount fails). The exact N depends on the
# initial full-commit fallbacks; check with: debugfs -R logdump
<image>   (count "tag TAIL" for the last tid).
set -eu
export PATH=3D$PATH:/sbin:/usr/sbin
N=3D${1:?N}; MKFS_ARGS=3D${2:--b 1024 -O fast_commit -J size=3D8}
UML=3D${UML:?path to UML kernel}
W=3D$(mktemp -d); IMG=3D$W/disk.img
# --- helpers (fsync loop, ext4 shutdown ioctl without log flush) ---
cat > $W/fsyncfill.c <<'C'
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
int main(int c, char **v) { int n =3D atoi(v[2]), fd =3D open(v[1],
O_CREAT|O_RDWR|O_APPEND, 0644);
  for (int i =3D 0; i < n; i++) { if (write(fd, "x", 1) !=3D 1 ||
fsync(fd)) { perror("w/fsync"); return 1; } } return 0; }
C
cat > $W/shutdown.c <<'C'
#include <stdio.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/types.h>
int main(int c, char **v) { __u32 f =3D 2; /* EXT4_GOING_FLAGS_NOLOGFLUSH *=
/
  int fd =3D open(v[1], O_RDONLY); if (fd < 0 || ioctl(fd, _IOR('X',
125, __u32), &f)) { perror("shutdown"); return 1; } return 0; }
C
gcc -O2 -o $W/fsyncfill $W/fsyncfill.c; gcc -O2 -o $W/shutdown $W/shutdown.=
c
# --- guest init: runs as PID 1 inside UML ---
cat > $W/init.sh <<'S'
#!/bin/bash
export PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
mount -t proc none /proc; mount -t tmpfs none /dev; mknod /dev/ubd0 b 98 0
for a in $(cat /proc/cmdline); do case $a in mode=3D*) MODE=3D${a#mode=3D};=
;
n=3D*) N=3D${a#n=3D};; w=3D*) W=3D${a#w=3D};; esac; done
mount -t tmpfs none /mnt; mkdir -p /mnt/out /mnt/t; mount -t hostfs
none /mnt/out -o hostfs=3D$W
{
if [ $MODE =3D fill ]; then
  mount -t ext4 -o commit=3D3600 /dev/ubd0 /mnt/t          #
commit=3D3600: no timer-driven full commit while we fill the FC area
  echo hello > /mnt/t/f; sync                              # full
commit: FC area starts empty for the next transaction
  $W/fsyncfill /mnt/t/f $N                                 # N x
(append 1 byte; fsync) =3D fast commits
  $W/shutdown /mnt/t                                       #
EXT4_IOC_SHUTDOWN, NOLOGFLUSH: no journal flush
else
  mount -t ext4 /dev/ubd0 /mnt/t; echo "mount exit status: $?"; wc -c /mnt/=
t/f
fi
dmesg | grep -E "JBD2|EXT4-fs"
} > /mnt/out/log.$MODE 2>&1
touch /mnt/out/done.$MODE; sleep 3600
S
chmod +x $W/init.sh
vm() {  # vm <image> <mode>; waits for the guest to finish, then
SIGKILLs UML (=3D power loss, no unmount)
  rm -f $W/done.$2
  $UML ubd0=3D$1 mem=3D512m root=3D/dev/root rootfstype=3Dhostfs rootflags=
=3D/
ro init=3D$W/init.sh mode=3D$2 n=3D$N w=3D$W con=3Dnull ssl=3Dnull con0=3Dn=
ull,fd:2
>$W/uml.$2 2>&1 &
  local p=3D$!; for i in $(seq 120); do [ -e $W/done.$2 ] && break;
sleep 1; done; kill -9 $p; wait $p 2>/dev/null || true; }
truncate -s 64M $IMG
mke2fs -q -F -t ext4 $MKFS_ARGS $IMG                 # default
journal/FC sizing unless overridden
vm $IMG fill                                          # fill the FC
area, shutdown without log flush, kill the VM
cp $IMG $W/crashed.img
echo "--- journal / FC log on the crashed image"; dumpe2fs -h
$W/crashed.img 2>&1 | grep -E "Block size|Total journal
blocks|needs_recovery" | cut -c1-70
debugfs -R logdump $W/crashed.img 2>/dev/null | grep -E "commit
block|tag (HEAD|TAIL)" | awk '/commit block/{c++} /tag TAIL/{t[$NF]++}
END{print c" full commits; FC TAIL tags per tid:"; for(k in t) print "
 tid",k":",t[k]}'
vm $IMG mount                                         # remount:
journal recovery runs here
echo "--- guest log (mount):"; cat $W/log.mount; echo "images/logs kept in =
$W"


 fs/jbd2/recovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jbd2/recovery.c b/fs/jbd2/recovery.c
index cac8c2cd4a92..a59de33a2a4a 100644
--- a/fs/jbd2/recovery.c
+++ b/fs/jbd2/recovery.c
@@ -242,7 +242,7 @@ static int fc_do_one_pass(journal_t *journal,
 	if (!journal->j_fc_replay_callback)
 		return 0;

-	while (next_fc_block <=3D journal->j_fc_last) {
+	while (next_fc_block < journal->j_fc_last) {
 		jbd2_debug(3, "Fast commit replay: next block %ld\n",
 			  next_fc_block);
 		err =3D jread(&bh, journal, next_fc_block);
--=20
2.47.0
